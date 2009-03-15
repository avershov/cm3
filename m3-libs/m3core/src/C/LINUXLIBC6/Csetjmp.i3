(* Copyright (C) 1990, Digital Equipment Corporation           *)
(* All rights reserved.                                        *)
(* See the file COPYRIGHT for a full description.              *)

(* Last modified on Fri Apr 30 16:25:40 PDT 1993 by muller         *)

INTERFACE Csetjmp;		(* for LINUX *)

FROM Ctypes IMPORT int;

TYPE 
  jmp_buf = RECORD
    opaque : ARRAY [1..39] OF INTEGER;
  END;

<*EXTERNAL*> PROCEDURE setjmp (VAR env: jmp_buf): int;
<*EXTERNAL*> PROCEDURE longjmp (VAR env: jmp_buf; val: int);

<*EXTERNAL "_setjmp" *>  PROCEDURE usetjmp (VAR env: jmp_buf): int;
<*EXTERNAL "_longjmp" *> PROCEDURE ulongjmp (VAR env: jmp_buf; val: int);

END Csetjmp.
