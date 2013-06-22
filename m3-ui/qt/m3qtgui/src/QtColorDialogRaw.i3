(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtColorDialogRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QColorDialog0 *>
PROCEDURE New_QColorDialog0 ( parent: ADDRESS;
): QColorDialog;

<* EXTERNAL New_QColorDialog1 *>
PROCEDURE New_QColorDialog1 (): QColorDialog;

<* EXTERNAL New_QColorDialog2 *>
PROCEDURE New_QColorDialog2 ( initial, parent: ADDRESS;
): QColorDialog;

<* EXTERNAL New_QColorDialog3 *>
PROCEDURE New_QColorDialog3 ( initial: ADDRESS;
): QColorDialog;

<* EXTERNAL Delete_QColorDialog *>
PROCEDURE Delete_QColorDialog ( self: QColorDialog;
);

<* EXTERNAL QColorDialog_setCurrentColor *>
PROCEDURE QColorDialog_setCurrentColor ( self: QColorDialog;
 color: ADDRESS;
);

<* EXTERNAL QColorDialog_currentColor *>
PROCEDURE QColorDialog_currentColor ( self: QColorDialog;
): ADDRESS;

<* EXTERNAL QColorDialog_selectedColor *>
PROCEDURE QColorDialog_selectedColor ( self: QColorDialog;
): ADDRESS;

<* EXTERNAL QColorDialog_setOption *>
PROCEDURE QColorDialog_setOption ( self: QColorDialog;
option: C.int;
on: BOOLEAN;
);

<* EXTERNAL QColorDialog_setOption1 *>
PROCEDURE QColorDialog_setOption1 ( self: QColorDialog;
option: C.int;
);

<* EXTERNAL QColorDialog_testOption *>
PROCEDURE QColorDialog_testOption ( self: QColorDialog;
option: C.int;
): BOOLEAN;

<* EXTERNAL QColorDialog_setOptions *>
PROCEDURE QColorDialog_setOptions ( self: QColorDialog;
options: C.int;
);

<* EXTERNAL QColorDialog_options *>
PROCEDURE QColorDialog_options ( self: QColorDialog;
): C.int;

<* EXTERNAL QColorDialog_open0_0 *>
PROCEDURE QColorDialog_open0_0 ( self: QColorDialog;
);

<* EXTERNAL QColorDialog_open1 *>
PROCEDURE QColorDialog_open1 ( self: QColorDialog;
 receiver: ADDRESS;
 member: C.char_star;
);

<* EXTERNAL QColorDialog_setVisible *>
PROCEDURE QColorDialog_setVisible ( self: QColorDialog;
visible: BOOLEAN;
);

<* EXTERNAL GetColor *>
PROCEDURE GetColor ( initial, parent, title: ADDRESS;
options: C.int;
): ADDRESS;

<* EXTERNAL GetColor1 *>
PROCEDURE GetColor1 ( initial, parent, title: ADDRESS;
): ADDRESS;

<* EXTERNAL GetColor2 *>
PROCEDURE GetColor2 ( initial, parent: ADDRESS;
): ADDRESS;

<* EXTERNAL GetColor3 *>
PROCEDURE GetColor3 ( initial: ADDRESS;
): ADDRESS;

<* EXTERNAL GetColor4 *>
PROCEDURE GetColor4 (): ADDRESS;

<* EXTERNAL GetRgba *>
PROCEDURE GetRgba (rgba: C.unsigned_int;
VAR ok: BOOLEAN;
 parent: ADDRESS;
): C.unsigned_int;

<* EXTERNAL GetRgba1 *>
PROCEDURE GetRgba1 (rgba: C.unsigned_int;
VAR ok: BOOLEAN;
): C.unsigned_int;

<* EXTERNAL GetRgba2 *>
PROCEDURE GetRgba2 (rgba: C.unsigned_int;
): C.unsigned_int;

<* EXTERNAL GetRgba3 *>
PROCEDURE GetRgba3 (): C.unsigned_int;

<* EXTERNAL CustomCount *>
PROCEDURE CustomCount (): C.int;

<* EXTERNAL CustomColor *>
PROCEDURE CustomColor (index: C.int;
): C.unsigned_int;

<* EXTERNAL SetCustomColor *>
PROCEDURE SetCustomColor (index: C.int;
color: C.unsigned_int;
);

<* EXTERNAL SetStandardColor *>
PROCEDURE SetStandardColor (index: C.int;
color: C.unsigned_int;
);

TYPE
QColorDialog = ADDRESS;

END QtColorDialogRaw.
