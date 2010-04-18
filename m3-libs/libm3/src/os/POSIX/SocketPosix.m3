(* Copyright 1996-2000, Critical Mass, Inc.  All rights reserved. *)
(* See file COPYRIGHT-CMASS for details. *)

UNSAFE MODULE SocketPosix EXPORTS Socket;

IMPORT Atom, AtomList, SocketPosix_IsUltrixOrOSF, File, FilePosix;
IMPORT OSError, OSErrorPosix, SchedulerPosix, Thread;
IMPORT Uuio, Ustat, Word;
FROM Cerrno IMPORT GetErrno;
FROM Unetdb IMPORT struct_hostent, struct_hostent_star, gethostbyname;
FROM Utypes IMPORT u_int;
FROM Ctypes IMPORT int, char;
FROM Usocket IMPORT accept, AF_INET, bind, connect, getpeername, getsockname,
                    getsockopt, listen, MSG_PEEK, recvfrom, sendto, setsockopt,
                    SO_LINGER, SO_REUSEADDR, SOCK_DGRAM, SOCK_STREAM, socket,
                    SOL_SOCKET, struct_linger;
FROM Uin IMPORT IPPROTO_TCP, ntohs, htons, struct_in_addr, struct_sockaddr_in;
FROM Unix IMPORT close, F_GETFL, F_SETFL, fcntl, FIONREAD, gethostname, ioctl,
                 M3_NONBLOCK;
FROM Uerror IMPORT EADDRINUSE, EADDRNOTAVAIL, EAGAIN, EALREADY, EBADF,
                   ECONNREFUSED, ECONNRESET, EHOSTDOWN, EHOSTUNREACH,
                   EINPROGRESS, EINVAL, EISCONN, EMFILE, ENETDOWN, ENETRESET,
                   ENETUNREACH, ENFILE, EPIPE, ETIMEDOUT, EWOULDBLOCK;

CONST
  TCP_NODELAY = 1;

REVEAL
  T = Public BRANDED "Socket.T" OBJECT
    ep: EndPoint   := NullEndPoint;
  OVERRIDES
    (* File.T methods *)
    read            := Read;
    write           := Write;
    status          := Status;
    close           := Close;
    (* Socket.T methods *)
    bind            := Bind;
    connect         := Connect;
    accept          := Accept;
    listen          := Listen;
    bytes_available := BytesAvailable;
    peek            := Peek;
    this_end        := ThisEnd;
    other_end       := OtherEnd;
    recv_from       := ReceiveFrom;
    send_to         := SendTo;
  END;

TYPE SockAddrIn = struct_sockaddr_in;

PROCEDURE Create (reliable: BOOLEAN): T
  RAISES {OSError.E} =
  VAR
    (*CONST*) Map := ARRAY BOOLEAN OF INTEGER { SOCK_DGRAM, SOCK_STREAM };
    t    := NEW (T, ds := FilePosix.ReadWrite);
    True := 1;
  BEGIN
    t.fd := socket (AF_INET, Map[reliable], 0);
    IF t.fd = -1 THEN
      VAR err := Unexpected; BEGIN
        WITH errno = GetErrno() DO
          IF errno = EMFILE OR errno = ENFILE THEN
            err := NoResources;
          END;
        END;
        IOError (err);
      END;
    END;
    MakeNonBlocking (t.fd);
    EVAL setsockopt (t.fd, SOL_SOCKET, SO_REUSEADDR,
                     ADR (True), BYTESIZE (True));
    RETURN t;
  END Create;

PROCEDURE Close (t: T)
  RAISES {OSError.E} =
  BEGIN
    IF close (t.fd) < 0 THEN
      IOError (Unexpected);
    END;
  END Close;

PROCEDURE Status (t: T): File.Status
  RAISES {OSError.E} =
  VAR
    statBuf : Ustat.struct_stat;
    status  : File.Status;
  BEGIN
    IF Ustat.fstat (t.fd, ADR (statBuf)) < 0 THEN IOError (Unexpected); END;
    status.type             := FileType;
    status.modificationTime := FLOAT (statBuf.st_mtime, LONGREAL);
    status.size             := statBuf.st_size;
    IF status.size < 0L THEN IOError (Unexpected); END;
    RETURN status
  END Status;  

PROCEDURE Bind (t: T;  READONLY ep: EndPoint)
  RAISES {OSError.E} =
  VAR
    name  : SockAddrIn;
    status: INTEGER;
  BEGIN
    SetAddress (t, ep, name);
    status := bind (t.fd, ADR (name), BYTESIZE (name));
    IF status # 0 THEN
      VAR err := Unexpected; BEGIN
        IF GetErrno() = EADDRINUSE THEN err := PortBusy; END;
        IOError (err);
      END;
    END;
  END Bind;

PROCEDURE Listen (t: T;  max_queue: CARDINAL)
  RAISES {OSError.E} =
  BEGIN
    IF listen (t.fd, max_queue) # 0 THEN
      IOError (Unexpected);
    END;
  END Listen;

PROCEDURE Connect (t: T;  READONLY ep: EndPoint)
  RAISES {OSError.E, Thread.Alerted} =
  VAR
    name: SockAddrIn;
    status: INTEGER;
  BEGIN
    SetAddress (t, ep, name);
    InitStream (t.fd);

    LOOP
      status := connect (t.fd, ADR(name), BYTESIZE(name));
      IF status = 0 THEN EXIT; END;

      WITH errno = GetErrno() DO
        IF errno = EINVAL THEN
          (* hack to try to get real errno, hidden due to NBIO bug in connect *)
          RefetchError (t.fd);
        ELSIF errno = EBADF THEN
          (* we'll try the same for EBADF, which we've seen on Alpha *)
          RefetchError (t.fd);
        END;
      END;

      WITH errno = GetErrno() DO
        IF errno = EISCONN THEN
          EXIT;
        ELSIF  (errno = EADDRNOTAVAIL)
            OR (errno = ECONNREFUSED)
            OR (errno = EINVAL)
            OR (errno = ECONNRESET)
            OR (errno = EBADF) THEN
          IOError (Refused);
        ELSIF (errno = ETIMEDOUT) THEN
          IOError (Timeout);
        ELSIF  (errno = ENETUNREACH)
            OR (errno = EHOSTUNREACH)
            OR (errno = EHOSTDOWN)
            OR (errno = ENETDOWN) THEN
          IOError (Unreachable);
        ELSIF (errno = EWOULDBLOCK)
           OR (errno = EAGAIN)
           OR (errno = EINPROGRESS)
           OR (errno = EALREADY) THEN
          (* nope, not yet *)
        ELSE
          IOError (Unexpected);
        END;
      END;

      EVAL SchedulerPosix.IOAlertWait (t.fd, FALSE);
    END;
  END Connect;

PROCEDURE Accept (t: T): T
  RAISES {OSError.E, Thread.Alerted} =
  VAR
    name : SockAddrIn;
    len  : INTEGER   := BYTESIZE(name);
    fd   : INTEGER;
    res  : T;
  BEGIN
    LOOP
      fd := accept (t.fd, ADR (name), ADR (len));
      IF fd >= 0 THEN EXIT; END;

      WITH errno = GetErrno() DO
        IF  (errno = EMFILE)
            OR (errno = ENFILE) THEN
          IOError (NoResources);
        ELSIF  (errno = EWOULDBLOCK)
            OR (errno = EAGAIN) THEN
          (* nope, not yet *)
        ELSE
          IOError (Unexpected);
        END;
      END;

      EVAL SchedulerPosix.IOAlertWait (t.fd, TRUE);
    END;

    res := NEW (T, fd := fd, ds := FilePosix.ReadWrite);
    AddressToEndPoint (name, res.ep);
    InitStream (fd);
    RETURN res;
  END Accept;

PROCEDURE ReceiveFrom (t: T;  VAR(*OUT*) ep: EndPoint;
                              VAR(*OUT*) b: ARRAY OF File.Byte;
                                         mayBlock := TRUE): INTEGER
  RAISES {OSError.E} =
  VAR
    name  : SockAddrIn;
    nmLen : INTEGER;
    len   : INTEGER;
    p_b   : ADDRESS := ADR (b[0]);
  BEGIN
    LOOP
      nmLen := BYTESIZE (name);
      len := recvfrom (t.fd, p_b, NUMBER (b), 0,
                       ADR (name), ADR (nmLen));
      IF len >= 0 THEN
        AddressToEndPoint (name, ep);
        RETURN len;
      END;

      WITH errno = GetErrno() DO
        IF (errno = ECONNRESET) THEN
          RETURN 0;
        ELSIF (errno = EPIPE)
           OR (errno = ENETRESET) THEN
          IOError (ConnLost);
        ELSIF (errno = ETIMEDOUT) THEN
          IOError (Timeout);
        ELSIF (errno = ENETUNREACH)
           OR (errno = EHOSTUNREACH)
           OR (errno = EHOSTDOWN)
           OR (errno = ENETDOWN) THEN
          IOError (Unreachable);
        ELSIF (errno = EWOULDBLOCK)
           OR (errno = EAGAIN) THEN
          IF NOT mayBlock THEN RETURN -1; END;
        ELSE
          IOError (Unexpected);
        END;
      END;

      EVAL SchedulerPosix.IOWait (t.fd, TRUE);
    END;
  END ReceiveFrom;

PROCEDURE Read (t: T;  VAR(*OUT*) b: ARRAY OF File.Byte;  mayBlock := TRUE): INTEGER
  RAISES {OSError.E} =
  VAR len: INTEGER;  p_b: ADDRESS := ADR (b[0]);
  BEGIN
    LOOP
      len := Uuio.read (t.fd, p_b, NUMBER (b));
      IF len >= 0 THEN RETURN len; END;

      WITH errno = GetErrno() DO
        IF (errno = ECONNRESET) THEN
          RETURN 0;
        ELSIF (errno = EPIPE)
           OR (errno = ENETRESET) THEN
          IOError (ConnLost);
        ELSIF (errno = ETIMEDOUT) THEN
          IOError (Timeout);
        ELSIF (errno = ENETUNREACH)
           OR (errno = EHOSTUNREACH)
           OR (errno = EHOSTDOWN)
           OR (errno = ENETDOWN) THEN
          IOError (Unreachable);
        ELSIF (errno = EWOULDBLOCK)
           OR (errno = EAGAIN) THEN
          IF NOT mayBlock THEN RETURN -1; END;
        ELSE
          IOError (Unexpected);
        END;
      END;

      EVAL SchedulerPosix.IOWait (t.fd, TRUE);
    END;
  END Read;

PROCEDURE SendTo (t: T;  READONLY ep: EndPoint;
                         READONLY b: ARRAY OF File.Byte)
  RAISES {OSError.E} =
  VAR
    len : INTEGER;
    p   : ADDRESS    := ADR(b[0]);
    n   : int := NUMBER(b);
    name: SockAddrIn;
  BEGIN
    WHILE n > 0 DO
      EndPointToAddress (ep, name);
      len := sendto (t.fd, p, n, 0, ADR (name), BYTESIZE (name));

      IF len >= 0 THEN
        INC (p, len);  DEC (n, len);
      ELSE
        WITH errno = GetErrno() DO
          IF     (errno = EPIPE)
              OR (errno = ECONNRESET)
              OR (errno = ENETRESET) THEN
            IOError (ConnLost);
          ELSIF (errno = ETIMEDOUT) THEN
            IOError (Timeout);
          ELSIF  (errno = ENETUNREACH)
              OR (errno = EHOSTUNREACH)
              OR (errno = EHOSTDOWN)
              OR (errno = ENETDOWN) THEN
            IOError (Unreachable);
          ELSIF  (errno = EWOULDBLOCK)
              OR (errno = EAGAIN) THEN
              (* OK, wait to write out a bit more... *)
          ELSE
            IOError (Unexpected);
          END;
        END;
      END;

      IF (n > 0) THEN
        EVAL SchedulerPosix.IOWait (t.fd, FALSE);
        (* IF Thread.TestAlert() THEN RAISE Thread.Alerted END *)
      END;
    END;
  END SendTo;

PROCEDURE Write (t: T;  READONLY b: ARRAY OF File.Byte)
  RAISES {OSError.E} =
  VAR
    len : INTEGER;
    p   : ADDRESS    := ADR(b[0]);
    n   : int := NUMBER(b);
  BEGIN
    WHILE n > 0 DO
      len := Uuio.write (t.fd, p, n);

      IF len >= 0 THEN
        INC (p, len);  DEC (n, len);
      ELSE
        WITH errno = GetErrno() DO
          IF     (errno = EPIPE)
              OR (errno = ECONNRESET)
              OR (errno = ENETRESET) THEN
            IOError (ConnLost);
          ELSIF (errno = ETIMEDOUT) THEN
            IOError (Timeout);
          ELSIF  (errno = ENETUNREACH)
              OR (errno = EHOSTUNREACH)
              OR (errno = EHOSTDOWN)
              OR (errno = ENETDOWN) THEN
            IOError (Unreachable);
          ELSIF  (errno = EWOULDBLOCK)
              OR (errno = EAGAIN) THEN
            (* OK, wait to write out a bit more... *)
          ELSE
            IOError (Unexpected);
          END;
        END;
      END;

      IF (n > 0) THEN
        EVAL SchedulerPosix.IOWait (t.fd, FALSE);
        (* IF Thread.TestAlert() THEN RAISE Thread.Alerted END *)
      END;
    END;
  END Write;

PROCEDURE BytesAvailable (t: T): CARDINAL
  RAISES {OSError.E} =
  VAR status: INTEGER;  charsToRead: int;
  BEGIN
    IF SchedulerPosix.IOWait (t.fd, TRUE, 0.0D0) =
                            SchedulerPosix.WaitResult.Ready THEN
      status := ioctl (t.fd, FIONREAD, ADR(charsToRead));
      IF status # 0 THEN IOError (Unexpected); END;
      RETURN MAX (0, charsToRead);
    END;
    RETURN 0;
  END BytesAvailable;

PROCEDURE Peek (t: T): EndPoint
  RAISES {OSError.E} =
  VAR
    name : SockAddrIn;
    len  : INTEGER     := BYTESIZE (name);
    ep   : EndPoint;
  BEGIN
    IF recvfrom (t.fd, NIL, 0, MSG_PEEK,
                 ADR (name), ADR (len)) < 0 THEN
      IOError (Unexpected);
    END;
    AddressToEndPoint (name, ep);
    RETURN ep;
  END Peek;

PROCEDURE ThisEnd (t: T): EndPoint
  RAISES {OSError.E} =
  VAR
    name : SockAddrIn;
    len  : INTEGER     := BYTESIZE (name);
  BEGIN
    IF t.ep.addr = NullAddress THEN
      t.ep.addr := GetHostAddr ();
    END;
    IF t.ep.port = NullPort THEN
      IF getsockname (t.fd, ADR (name), ADR (len)) # 0 THEN
        IOError (Unexpected);
      END;
      t.ep.port := ntohs (name.sin_port);
    END;
    RETURN t.ep
  END ThisEnd;

PROCEDURE GetHostAddr (): Address
  RAISES {OSError.E} =
  VAR
    host : ARRAY [0..255] OF CHAR;
    hostent: struct_hostent;
    info : struct_hostent_star;
    ua   : struct_in_addr;
  BEGIN
    IF gethostname (ADR (host[0]), BYTESIZE (host)) # 0 THEN
      IOError (Unexpected);
    END;

    info := gethostbyname (ADR (host[0]), ADR (hostent));
    IF info = NIL THEN IOError (Unexpected); END;
    <* ASSERT info.h_length <= BYTESIZE (Address) *>

    ua := LOOPHOLE(info.h_addr_list,
                   UNTRACED REF UNTRACED REF struct_in_addr)^^;
    RETURN LOOPHOLE (ua.s_addr, Address);
  END GetHostAddr;

PROCEDURE OtherEnd (t: T): EndPoint
  RAISES {OSError.E} =
  VAR
    addr : SockAddrIn;
    len  : int := BYTESIZE (addr);
    ep   : EndPoint;
  BEGIN
    IF getpeername (t.fd, ADR (addr), ADR (len)) < 0 THEN
      IOError (Unexpected);
    END;
    AddressToEndPoint (addr, ep);
    RETURN ep;
  END OtherEnd;

(*------------------------------------------------ internal utilities ---*)

PROCEDURE SetAddress (t: T;  READONLY ep: EndPoint;  VAR(*OUT*) name: SockAddrIn) =
  BEGIN
    t.ep := ep;
    EndPointToAddress (ep, name);
  END SetAddress;

PROCEDURE EndPointToAddress (READONLY ep: EndPoint;  VAR(*OUT*) name: SockAddrIn) =
  CONST Sin_Zero = ARRAY [0 .. 7] OF char{VAL(0, char), ..};
  BEGIN
    name.sin_family      := AF_INET;
    name.sin_port        := htons (ep.port);
    name.sin_addr.s_addr := LOOPHOLE (ep.addr, u_int);
    name.sin_zero        := Sin_Zero;
  END EndPointToAddress;

PROCEDURE AddressToEndPoint (READONLY name: SockAddrIn;  VAR(*OUT*) ep: EndPoint) =
  BEGIN
    ep.addr := LOOPHOLE (name.sin_addr.s_addr, Address);
    ep.port := ntohs (name.sin_port);
  END AddressToEndPoint;

(*
VAR SysSendBufSize: INTEGER := 128000;
VAR SysRcvBufSize: INTEGER := 128000;
*)

PROCEDURE InitStream (fd: CARDINAL)
  RAISES {OSError.E} =
  (* We assume that the runtime ignores SIGPIPE signals *)
  VAR
    one : int := 1;
    linger := struct_linger{1, 1};
  BEGIN
    (*****
    EVAL setsockopt(fd, SOL_SOCKET, SO_SNDBUF,
                    ADR(SysSendBufSize), BYTESIZE(SysSendBufSize));
    EVAL setsockopt(fd, SOL_SOCKET, SO_RCVBUF,
                    ADR(SysRcvBufSize), BYTESIZE(SysRcvBufSize));
    ******)
    EVAL setsockopt(fd, SOL_SOCKET, SO_LINGER,
                    ADR(linger), BYTESIZE(linger));
    EVAL setsockopt(fd, IPPROTO_TCP, TCP_NODELAY,
                    ADR(one), BYTESIZE(one));

    MakeNonBlocking (fd);
  END InitStream;

PROCEDURE MakeNonBlocking (fd: INTEGER)
  RAISES {OSError.E} =
  VAR
    old_mode := fcntl (fd, F_GETFL, 0);
    new_mode := Word.Or (old_mode, M3_NONBLOCK);  
  BEGIN
    IF fcntl (fd, F_SETFL, new_mode) # 0 THEN
      IOError (Unexpected);
    END;
  END MakeNonBlocking;

PROCEDURE RefetchError(fd: INTEGER) =
(* Awful hack to retrieve a meaningful error from a TCP accept
   socket.  Only works on Ultrix and OSF.  Leaves result
   in GetErrno().  *)
  VAR optbuf: int := 0;   optlen := BYTESIZE(optbuf);
  BEGIN
    IF SocketPosix_IsUltrixOrOSF.Value THEN
      EVAL getsockopt (fd, IPPROTO_TCP, TCP_NODELAY,
                       ADR(optbuf), ADR(optlen));
    END;
  END RefetchError;

PROCEDURE IOError (a: Atom.T) RAISES {OSError.E} =
  VAR ec: AtomList.T := NIL;
  BEGIN
    IF (GetErrno() # 0) THEN
      ec := AtomList.List1 (OSErrorPosix.ErrnoAtom (GetErrno()));
    END;
    RAISE OSError.E (AtomList.Cons (a, ec));
  END IOError;

BEGIN
END SocketPosix.
