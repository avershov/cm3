(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtScrollAreaRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QScrollArea0 *>
PROCEDURE New_QScrollArea0 ( parent: ADDRESS;
): QScrollArea;

<* EXTERNAL New_QScrollArea1 *>
PROCEDURE New_QScrollArea1 (): QScrollArea;

<* EXTERNAL Delete_QScrollArea *>
PROCEDURE Delete_QScrollArea ( self: QScrollArea;
);

<* EXTERNAL QScrollArea_widget *>
PROCEDURE QScrollArea_widget ( self: QScrollArea;
): ADDRESS;

<* EXTERNAL QScrollArea_setWidget *>
PROCEDURE QScrollArea_setWidget ( self: QScrollArea;
 widget: ADDRESS;
);

<* EXTERNAL QScrollArea_takeWidget *>
PROCEDURE QScrollArea_takeWidget ( self: QScrollArea;
): ADDRESS;

<* EXTERNAL QScrollArea_widgetResizable *>
PROCEDURE QScrollArea_widgetResizable ( self: QScrollArea;
): BOOLEAN;

<* EXTERNAL QScrollArea_setWidgetResizable *>
PROCEDURE QScrollArea_setWidgetResizable ( self: QScrollArea;
resizable: BOOLEAN;
);

<* EXTERNAL QScrollArea_sizeHint *>
PROCEDURE QScrollArea_sizeHint ( self: QScrollArea;
): ADDRESS;

<* EXTERNAL QScrollArea_focusNextPrevChild *>
PROCEDURE QScrollArea_focusNextPrevChild ( self: QScrollArea;
next: BOOLEAN;
): BOOLEAN;

<* EXTERNAL QScrollArea_alignment *>
PROCEDURE QScrollArea_alignment ( self: QScrollArea;
): C.int;

<* EXTERNAL QScrollArea_setAlignment *>
PROCEDURE QScrollArea_setAlignment ( self: QScrollArea;
arg2: C.int;
);

<* EXTERNAL QScrollArea_ensureVisible *>
PROCEDURE QScrollArea_ensureVisible ( self: QScrollArea;
x, y, xmargin, ymargin: C.int;
);

<* EXTERNAL QScrollArea_ensureVisible1 *>
PROCEDURE QScrollArea_ensureVisible1 ( self: QScrollArea;
x, y, xmargin: C.int;
);

<* EXTERNAL QScrollArea_ensureVisible2 *>
PROCEDURE QScrollArea_ensureVisible2 ( self: QScrollArea;
x, y: C.int;
);

<* EXTERNAL QScrollArea_ensureWidgetVisible *>
PROCEDURE QScrollArea_ensureWidgetVisible ( self: QScrollArea;
 childWidget: ADDRESS;
xmargin, ymargin: C.int;
);

<* EXTERNAL QScrollArea_ensureWidgetVisible1 *>
PROCEDURE QScrollArea_ensureWidgetVisible1 ( self: QScrollArea;
 childWidget: ADDRESS;
xmargin: C.int;
);

<* EXTERNAL QScrollArea_ensureWidgetVisible2 *>
PROCEDURE QScrollArea_ensureWidgetVisible2 ( self: QScrollArea;
 childWidget: ADDRESS;
);

TYPE
QScrollArea = ADDRESS;

END QtScrollAreaRaw.
