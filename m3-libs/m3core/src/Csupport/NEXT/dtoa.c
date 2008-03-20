/* Copyright (C) 1992, Digital Equipment Corporation                         */
/* All rights reserved.                                                      */
/* See the file COPYRIGHT for a full description.                            */

/* Last modified on Wed Nov 30 08:38:25 PST 1994 by kalsow                   */
/*      modified on Tue Feb 11 14:23:51 PST 1992 by muller                   */

#ifndef IEEE_MC68k
#define IEEE_MC68k
#endif

#undef  IEEE_8087

#define MULTIPLE_THREADS
#define ACQUIRE_DTOA_LOCK(n) RTOS__LockHeap()
#define FREE_DTOA_LOCK(n) RTOS__UnlockHeap()

#include "dtoa.h"
