(* Test First_readable_addr. *)

INTERFACE F0;

TYPE T0 = RECORD x0: ARRAY [0..0] OF CHAR; END;
TYPE T1 = RECORD x0: ARRAY [0..1] OF CHAR; END;
TYPE T2 = RECORD x0: ARRAY [0..2] OF CHAR; END;

TYPE T4094 = RECORD x0: ARRAY [0..4094] OF CHAR; END;
TYPE T4095 = RECORD x0: ARRAY [0..4095] OF CHAR; END;
TYPE T4096 = RECORD x0: ARRAY [0..4096] OF CHAR; END;
TYPE T4097 = RECORD x0: ARRAY [0..4097] OF CHAR; END;

(* x8 is times 8, m is minus, p is plus *)

TYPE T4096x8 = RECORD x0: ARRAY [0..4096 * 8] OF CHAR; END;

TYPE T4096x8m8 = RECORD x0: ARRAY [0..4096 * 8 - 8] OF CHAR; END;
TYPE T4096x8m7 = RECORD x0: ARRAY [0..4096 * 8 - 7] OF CHAR; END;
TYPE T4096x8m6 = RECORD x0: ARRAY [0..4096 * 8 - 6] OF CHAR; END;
TYPE T4096x8m5 = RECORD x0: ARRAY [0..4096 * 8 - 5] OF CHAR; END;
TYPE T4096x8m4 = RECORD x0: ARRAY [0..4096 * 8 - 4] OF CHAR; END;
TYPE T4096x8m3 = RECORD x0: ARRAY [0..4096 * 8 - 3] OF CHAR; END;
TYPE T4096x8m2 = RECORD x0: ARRAY [0..4096 * 8 - 2] OF CHAR; END;
TYPE T4096x8m1 = RECORD x0: ARRAY [0..4096 * 8 - 1] OF CHAR; END;
TYPE T4096x8p1 = RECORD x0: ARRAY [0..4096 * 8 + 1] OF CHAR; END;
TYPE T4096x8p2 = RECORD x0: ARRAY [0..4096 * 8 + 2] OF CHAR; END;
 
PROCEDURE F1(t: REF T0): CHAR;

END F0.
