/* M3 language support routines for GDB, the GNU debugger.
   Copyright 1992, 1993 Free Software Foundation, Inc.

This file is part of GDB.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */


/*
   Modula-3 type uids are unsiged 32-bit values.  They are passed as signed
   decimal integers in the intermediate code, but converted to 6-byte, base 62
   strings of characters between the back end and the debugger.  To avoid
   surprises, these  strings are also legal C identifiers.
*/

#if !defined (M3_UID_H)
#define M3_UID_H 1

#include "m3-bool.h"

#define M3UID_LEN 6

extern char *
m3uid_from_num (const LONGEST x);
/* converts the integer uid 'x' to its string representation */

extern BOOL
m3uid_to_num (const char *uid, LONGEST *num_val);
/* converts the string 'uid' to a numeric 'int_val',
   returns a boolean indicating success. */

#endif /* !defined (M3_UID_H) */

/* End of file "m3-uid.h" */
