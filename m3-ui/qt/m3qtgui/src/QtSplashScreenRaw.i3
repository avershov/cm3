(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtSplashScreenRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QSplashScreen0 *>
PROCEDURE New_QSplashScreen0 ( pixmap: ADDRESS;
f: C.int;
): QSplashScreen;

<* EXTERNAL New_QSplashScreen1 *>
PROCEDURE New_QSplashScreen1 ( pixmap: ADDRESS;
): QSplashScreen;

<* EXTERNAL New_QSplashScreen2 *>
PROCEDURE New_QSplashScreen2 (): QSplashScreen;

<* EXTERNAL New_QSplashScreen3 *>
PROCEDURE New_QSplashScreen3 ( parent, pixmap: ADDRESS;
f: C.int;
): QSplashScreen;

<* EXTERNAL New_QSplashScreen4 *>
PROCEDURE New_QSplashScreen4 ( parent, pixmap: ADDRESS;
): QSplashScreen;

<* EXTERNAL New_QSplashScreen5 *>
PROCEDURE New_QSplashScreen5 ( parent: ADDRESS;
): QSplashScreen;

<* EXTERNAL Delete_QSplashScreen *>
PROCEDURE Delete_QSplashScreen ( self: QSplashScreen;
);

<* EXTERNAL QSplashScreen_setPixmap *>
PROCEDURE QSplashScreen_setPixmap ( self: QSplashScreen;
 pixmap: ADDRESS;
);

<* EXTERNAL QSplashScreen_pixmap *>
PROCEDURE QSplashScreen_pixmap ( self: QSplashScreen;
): ADDRESS;

<* EXTERNAL QSplashScreen_finish *>
PROCEDURE QSplashScreen_finish ( self: QSplashScreen;
 w: ADDRESS;
);

<* EXTERNAL QSplashScreen_repaint *>
PROCEDURE QSplashScreen_repaint ( self: QSplashScreen;
);

<* EXTERNAL QSplashScreen_showMessage *>
PROCEDURE QSplashScreen_showMessage ( self: QSplashScreen;
 message: ADDRESS;
alignment: C.int;
 color: ADDRESS;
);

<* EXTERNAL QSplashScreen_showMessage1 *>
PROCEDURE QSplashScreen_showMessage1 ( self: QSplashScreen;
 message: ADDRESS;
alignment: C.int;
);

<* EXTERNAL QSplashScreen_showMessage2 *>
PROCEDURE QSplashScreen_showMessage2 ( self: QSplashScreen;
 message: ADDRESS;
);

<* EXTERNAL QSplashScreen_clearMessage *>
PROCEDURE QSplashScreen_clearMessage ( self: QSplashScreen;
);

TYPE
QSplashScreen = ADDRESS;

END QtSplashScreenRaw.
