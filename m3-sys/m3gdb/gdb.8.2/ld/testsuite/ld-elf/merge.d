#source: merge.s
#ld: -T merge.ld
#objdump: -s
#xfail: "bfin-*-*" "cr16-*-*" "cris*-*-*" "crx-*-*" "d10v-*-*" "d30v-*-*"
#xfail: "dlx-*-*" "fr30-*-*" "frv-*-*" "hppa*64*-*-*" "h8300-*-*" "score-*-*"
#xfail: "ip2k-*-*" "iq2000-*-*" "lm32-*-*"
#xfail: "mcore-*-*" "mn102*-*-*" "ms1-*-*" "mep-*-*" "m68hc11-*-*" "nios2-*-*" s12z-*-*
#xfail: "or32-*-*" "pj-*-*" "tic6x-*-*" "vax-*-*" "xstormy16-*-*"
#xfail: "xtensa*-*-*" "metag-*-*" "ft32-*-*" "pru-*-*"

.*:     file format .*elf.*

Contents of section .text:
 1000 (1010)?0000(1010)? (1210)?0000(1012)? (0c)?000000(0c)? (0e)?000000(0e)? .*
Contents of section .rodata:
 1010 61626300 .*
#pass
