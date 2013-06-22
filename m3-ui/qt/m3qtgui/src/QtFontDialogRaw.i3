(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtFontDialogRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QFontDialog0 *>
PROCEDURE New_QFontDialog0 ( parent: ADDRESS;
): QFontDialog;

<* EXTERNAL New_QFontDialog1 *>
PROCEDURE New_QFontDialog1 (): QFontDialog;

<* EXTERNAL New_QFontDialog2 *>
PROCEDURE New_QFontDialog2 ( initial, parent: ADDRESS;
): QFontDialog;

<* EXTERNAL New_QFontDialog3 *>
PROCEDURE New_QFontDialog3 ( initial: ADDRESS;
): QFontDialog;

<* EXTERNAL Delete_QFontDialog *>
PROCEDURE Delete_QFontDialog ( self: QFontDialog;
);

<* EXTERNAL QFontDialog_setCurrentFont *>
PROCEDURE QFontDialog_setCurrentFont ( self: QFontDialog;
 font: ADDRESS;
);

<* EXTERNAL QFontDialog_currentFont *>
PROCEDURE QFontDialog_currentFont ( self: QFontDialog;
): ADDRESS;

<* EXTERNAL QFontDialog_selectedFont *>
PROCEDURE QFontDialog_selectedFont ( self: QFontDialog;
): ADDRESS;

<* EXTERNAL QFontDialog_setOption *>
PROCEDURE QFontDialog_setOption ( self: QFontDialog;
option: C.int;
on: BOOLEAN;
);

<* EXTERNAL QFontDialog_setOption1 *>
PROCEDURE QFontDialog_setOption1 ( self: QFontDialog;
option: C.int;
);

<* EXTERNAL QFontDialog_testOption *>
PROCEDURE QFontDialog_testOption ( self: QFontDialog;
option: C.int;
): BOOLEAN;

<* EXTERNAL QFontDialog_setOptions *>
PROCEDURE QFontDialog_setOptions ( self: QFontDialog;
options: C.int;
);

<* EXTERNAL QFontDialog_options *>
PROCEDURE QFontDialog_options ( self: QFontDialog;
): C.int;

<* EXTERNAL QFontDialog_open0_0 *>
PROCEDURE QFontDialog_open0_0 ( self: QFontDialog;
);

<* EXTERNAL QFontDialog_open1 *>
PROCEDURE QFontDialog_open1 ( self: QFontDialog;
 receiver: ADDRESS;
 member: C.char_star;
);

<* EXTERNAL QFontDialog_setVisible *>
PROCEDURE QFontDialog_setVisible ( self: QFontDialog;
visible: BOOLEAN;
);

<* EXTERNAL GetFont *>
PROCEDURE GetFont (VAR ok: BOOLEAN;
 initial, parent, title: ADDRESS;
options: C.int;
): ADDRESS;

<* EXTERNAL GetFont1 *>
PROCEDURE GetFont1 (VAR ok: BOOLEAN;
 initial, parent, title: ADDRESS;
): ADDRESS;

<* EXTERNAL GetFont2 *>
PROCEDURE GetFont2 (VAR ok: BOOLEAN;
 initial, parent: ADDRESS;
): ADDRESS;

<* EXTERNAL GetFont3 *>
PROCEDURE GetFont3 (VAR ok: BOOLEAN;
 initial: ADDRESS;
): ADDRESS;

<* EXTERNAL GetFont4 *>
PROCEDURE GetFont4 (VAR ok: BOOLEAN;
 parent: ADDRESS;
): ADDRESS;

<* EXTERNAL GetFont5 *>
PROCEDURE GetFont5 (VAR ok: BOOLEAN;
): ADDRESS;

TYPE
QFontDialog = ADDRESS;

END QtFontDialogRaw.
