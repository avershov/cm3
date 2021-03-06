(* Copyright (C) 1990, Digital Equipment Corporation.         *)
(* All rights reserved.                                       *)
(* See the file COPYRIGHT for a full description.             *)

(* Last modified on Thu Jan  4 02:29:41 1990 by muller        *)
(*      modified on Thu Dec 21 11:24:22 1989 by kalsow        *)

MODULE CConvert;
IMPORT RTOS;

VAR
  locked := ARRAY[0..1] OF BOOLEAN {FALSE, ..};
  waiters := ARRAY[0..1] OF BOOLEAN {FALSE, ..};

PROCEDURE Acquire (n: INTEGER) =
  BEGIN
    TRY
      RTOS.LockHeap();
      WHILE locked[n] DO
        waiters[n] := TRUE;
        RTOS.WaitHeap();
      END;
      locked[n] := TRUE;
    FINALLY
      RTOS.UnlockHeap();
    END;
  END Acquire;

PROCEDURE Release (n: INTEGER) =
  BEGIN
    TRY
      RTOS.LockHeap();
      <*ASSERT locked[n]*>
      locked[n] := FALSE;
      IF waiters[n] THEN
        waiters[n] := FALSE;
        RTOS.BroadcastHeap();
      END;
    FINALLY
      RTOS.UnlockHeap();
    END;
  END Release;

BEGIN
END CConvert.
