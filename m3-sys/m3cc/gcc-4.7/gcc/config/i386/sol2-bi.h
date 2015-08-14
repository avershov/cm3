/* Modula-3: modified */

/* Definitions of target machine for GCC, for bi-arch Solaris 2/x86.
   Copyright (C) 2004, 2006, 2007, 2008, 2009, 2010, 2011
   Free Software Foundation, Inc.
   Contributed by CodeSourcery, LLC.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING3.  If not see
<http://www.gnu.org/licenses/>.  */

/* Override i386/sol2.h version: return 8-byte vectors in MMX registers if
   possible, matching Sun Studio 12 Update 1+ compilers and other x86
   targets.  */
#undef TARGET_SUBTARGET_DEFAULT
#define TARGET_SUBTARGET_DEFAULT \
	(MASK_80387 | MASK_IEEE_FP | MASK_FLOAT_RETURNS)

#define SUBTARGET_OPTIMIZATION_OPTIONS				\
  { OPT_LEVELS_1_PLUS, OPT_momit_leaf_frame_pointer, NULL, 1 }

#define DEFAULT_ARCH32_P !TARGET_64BIT_DEFAULT

#define ARCH64_SUBDIR "amd64"

#undef ASM_COMMENT_START
#define ASM_COMMENT_START "/"

/* The native Solaris assembler can't calculate the difference between
   symbols in different sections, which causes problems for -fPIC jump
   tables in .rodata.  */
#ifndef HAVE_AS_IX86_DIFF_SECT_DELTA
#undef JUMP_TABLES_IN_TEXT_SECTION
#define JUMP_TABLES_IN_TEXT_SECTION 1

/* The native Solaris assembler cannot handle the SYMBOL-. syntax, but
   requires SYMBOL@rel/@rel64 instead.  */
#define ASM_OUTPUT_DWARF_PCREL(FILE, SIZE, LABEL)	\
  do {							\
    fputs (integer_asm_op (SIZE, FALSE), FILE);		\
    assemble_name (FILE, LABEL);			\
    fputs (SIZE == 8 ? "@rel64" : "@rel", FILE);	\
  } while (0)
#endif

/* As in sol2.h, override the default from i386/x86-64.h to work around
   Sun as TLS bug.  */
#undef  ASM_OUTPUT_ALIGNED_COMMON
#define ASM_OUTPUT_ALIGNED_COMMON(FILE, NAME, SIZE, ALIGN)		\
  do									\
    {									\
      if (TARGET_SUN_TLS						\
	  && in_section							\
	  && ((in_section->common.flags & SECTION_TLS) == SECTION_TLS))	\
	switch_to_section (bss_section);				\
      x86_elf_aligned_common (FILE, NAME, SIZE, ALIGN);			\
    }									\
  while  (0)

#define USE_IX86_FRAME_POINTER 1
#define USE_X86_64_FRAME_POINTER 1

#undef NO_PROFILE_COUNTERS

#undef MCOUNT_NAME
#define MCOUNT_NAME "_mcount"
