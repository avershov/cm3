(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtWSEmbedWidgetRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QWSEmbedWidget0 *>
PROCEDURE New_QWSEmbedWidget0 (winId: C.int;
 parent: ADDRESS;
): QWSEmbedWidget;

<* EXTERNAL New_QWSEmbedWidget1 *>
PROCEDURE New_QWSEmbedWidget1 (winId: C.int;
): QWSEmbedWidget;

<* EXTERNAL Delete_QWSEmbedWidget *>
PROCEDURE Delete_QWSEmbedWidget ( self: QWSEmbedWidget;
);

TYPE
QWSEmbedWidget = ADDRESS;

END QtWSEmbedWidgetRaw.
