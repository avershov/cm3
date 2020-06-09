/* Native debugging support for procfs targets.

   Copyright (C) 2009-2018 Free Software Foundation, Inc.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* Return a ptid for which we guarantee we will be able to find a
   'live' procinfo.  */

extern ptid_t procfs_first_available (void);

#if (defined (__i386__) || defined (__x86_64__)) && defined (sun)
struct ssd;

extern struct ssd *procfs_find_LDT_entry (ptid_t);
#endif

