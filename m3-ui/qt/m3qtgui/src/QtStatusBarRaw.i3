(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtStatusBarRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QStatusBar0 *>
PROCEDURE New_QStatusBar0 ( parent: ADDRESS;
): QStatusBar;

<* EXTERNAL New_QStatusBar1 *>
PROCEDURE New_QStatusBar1 (): QStatusBar;

<* EXTERNAL Delete_QStatusBar *>
PROCEDURE Delete_QStatusBar ( self: QStatusBar;
);

<* EXTERNAL QStatusBar_addWidget *>
PROCEDURE QStatusBar_addWidget ( self: QStatusBar;
 widget: ADDRESS;
stretch: C.int;
);

<* EXTERNAL QStatusBar_addWidget1 *>
PROCEDURE QStatusBar_addWidget1 ( self: QStatusBar;
 widget: ADDRESS;
);

<* EXTERNAL QStatusBar_insertWidget *>
PROCEDURE QStatusBar_insertWidget ( self: QStatusBar;
index: C.int;
 widget: ADDRESS;
stretch: C.int;
): C.int;

<* EXTERNAL QStatusBar_insertWidget1 *>
PROCEDURE QStatusBar_insertWidget1 ( self: QStatusBar;
index: C.int;
 widget: ADDRESS;
): C.int;

<* EXTERNAL QStatusBar_addPermanentWidget *>
PROCEDURE QStatusBar_addPermanentWidget ( self: QStatusBar;
 widget: ADDRESS;
stretch: C.int;
);

<* EXTERNAL QStatusBar_addPermanentWidget1 *>
PROCEDURE QStatusBar_addPermanentWidget1 ( self: QStatusBar;
 widget: ADDRESS;
);

<* EXTERNAL QStatusBar_insertPermanentWidget *>
PROCEDURE QStatusBar_insertPermanentWidget ( self: QStatusBar;
index: C.int;
 widget: ADDRESS;
stretch: C.int;
): C.int;

<* EXTERNAL QStatusBar_insertPermanentWidget1 *>
PROCEDURE QStatusBar_insertPermanentWidget1 ( self: QStatusBar;
index: C.int;
 widget: ADDRESS;
): C.int;

<* EXTERNAL QStatusBar_removeWidget *>
PROCEDURE QStatusBar_removeWidget ( self: QStatusBar;
 widget: ADDRESS;
);

<* EXTERNAL QStatusBar_setSizeGripEnabled *>
PROCEDURE QStatusBar_setSizeGripEnabled ( self: QStatusBar;
arg2: BOOLEAN;
);

<* EXTERNAL QStatusBar_isSizeGripEnabled *>
PROCEDURE QStatusBar_isSizeGripEnabled ( self: QStatusBar;
): BOOLEAN;

<* EXTERNAL QStatusBar_currentMessage *>
PROCEDURE QStatusBar_currentMessage ( self: QStatusBar;
): ADDRESS;

<* EXTERNAL QStatusBar_showMessage *>
PROCEDURE QStatusBar_showMessage ( self: QStatusBar;
 text: ADDRESS;
timeout: C.int;
);

<* EXTERNAL QStatusBar_showMessage1 *>
PROCEDURE QStatusBar_showMessage1 ( self: QStatusBar;
 text: ADDRESS;
);

<* EXTERNAL QStatusBar_clearMessage *>
PROCEDURE QStatusBar_clearMessage ( self: QStatusBar;
);

TYPE
QStatusBar = ADDRESS;

END QtStatusBarRaw.
