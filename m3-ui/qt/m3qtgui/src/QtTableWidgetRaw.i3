(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtTableWidgetRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QTableWidgetSelectionRange0 *>
PROCEDURE New_QTableWidgetSelectionRange0 (): QTableWidgetSelectionRange;

<* EXTERNAL New_QTableWidgetSelectionRange1 *>
PROCEDURE New_QTableWidgetSelectionRange1 (top, left, bottom, right: C.int;
): QTableWidgetSelectionRange;

<* EXTERNAL New_QTableWidgetSelectionRange2 *>
PROCEDURE New_QTableWidgetSelectionRange2 ( other: ADDRESS;
): QTableWidgetSelectionRange;

<* EXTERNAL Delete_QTableWidgetSelectionRange *>
PROCEDURE Delete_QTableWidgetSelectionRange ( self: QTableWidgetSelectionRange;
);

<* EXTERNAL QTableWidgetSelectionRange_topRow *>
PROCEDURE QTableWidgetSelectionRange_topRow ( self: QTableWidgetSelectionRange;
): C.int;

<* EXTERNAL QTableWidgetSelectionRange_bottomRow *>
PROCEDURE QTableWidgetSelectionRange_bottomRow ( self: QTableWidgetSelectionRange;
): C.int;

<* EXTERNAL QTableWidgetSelectionRange_leftColumn *>
PROCEDURE QTableWidgetSelectionRange_leftColumn ( self: QTableWidgetSelectionRange;
): C.int;

<* EXTERNAL QTableWidgetSelectionRange_rightColumn *>
PROCEDURE QTableWidgetSelectionRange_rightColumn ( self: QTableWidgetSelectionRange;
): C.int;

<* EXTERNAL QTableWidgetSelectionRange_rowCount *>
PROCEDURE QTableWidgetSelectionRange_rowCount ( self: QTableWidgetSelectionRange;
): C.int;

<* EXTERNAL QTableWidgetSelectionRange_columnCount *>
PROCEDURE QTableWidgetSelectionRange_columnCount ( self: QTableWidgetSelectionRange;
): C.int;

TYPE
QTableWidgetSelectionRange <: ADDRESS;

<* EXTERNAL New_QTableWidgetItem0 *>
PROCEDURE New_QTableWidgetItem0 (type: C.int;
): QTableWidgetItem;

<* EXTERNAL New_QTableWidgetItem1 *>
PROCEDURE New_QTableWidgetItem1 (): QTableWidgetItem;

<* EXTERNAL New_QTableWidgetItem2 *>
PROCEDURE New_QTableWidgetItem2 ( text: ADDRESS;
type: C.int;
): QTableWidgetItem;

<* EXTERNAL New_QTableWidgetItem3 *>
PROCEDURE New_QTableWidgetItem3 ( text: ADDRESS;
): QTableWidgetItem;

<* EXTERNAL New_QTableWidgetItem4 *>
PROCEDURE New_QTableWidgetItem4 ( icon, text: ADDRESS;
type: C.int;
): QTableWidgetItem;

<* EXTERNAL New_QTableWidgetItem5 *>
PROCEDURE New_QTableWidgetItem5 ( icon, text: ADDRESS;
): QTableWidgetItem;

<* EXTERNAL New_QTableWidgetItem6 *>
PROCEDURE New_QTableWidgetItem6 ( other: ADDRESS;
): QTableWidgetItem;

<* EXTERNAL Delete_QTableWidgetItem *>
PROCEDURE Delete_QTableWidgetItem ( self: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_clone *>
PROCEDURE QTableWidgetItem_clone ( self: ADDRESS;
): QTableWidgetItem;

<* EXTERNAL QTableWidgetItem_tableWidget *>
PROCEDURE QTableWidgetItem_tableWidget ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_row *>
PROCEDURE QTableWidgetItem_row ( self: ADDRESS;
): C.int;

<* EXTERNAL QTableWidgetItem_column *>
PROCEDURE QTableWidgetItem_column ( self: ADDRESS;
): C.int;

<* EXTERNAL QTableWidgetItem_setSelected *>
PROCEDURE QTableWidgetItem_setSelected ( self: ADDRESS;
select: BOOLEAN;
);

<* EXTERNAL QTableWidgetItem_isSelected *>
PROCEDURE QTableWidgetItem_isSelected ( self: ADDRESS;
): BOOLEAN;

<* EXTERNAL QTableWidgetItem_flags *>
PROCEDURE QTableWidgetItem_flags ( self: ADDRESS;
): C.int;

<* EXTERNAL QTableWidgetItem_setFlags *>
PROCEDURE QTableWidgetItem_setFlags ( self: ADDRESS;
flags: C.int;
);

<* EXTERNAL QTableWidgetItem_text *>
PROCEDURE QTableWidgetItem_text ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setText *>
PROCEDURE QTableWidgetItem_setText ( self, text: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_icon *>
PROCEDURE QTableWidgetItem_icon ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setIcon *>
PROCEDURE QTableWidgetItem_setIcon ( self, icon: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_statusTip *>
PROCEDURE QTableWidgetItem_statusTip ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setStatusTip *>
PROCEDURE QTableWidgetItem_setStatusTip ( self, statusTip: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_toolTip *>
PROCEDURE QTableWidgetItem_toolTip ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setToolTip *>
PROCEDURE QTableWidgetItem_setToolTip ( self, toolTip: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_whatsThis *>
PROCEDURE QTableWidgetItem_whatsThis ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setWhatsThis *>
PROCEDURE QTableWidgetItem_setWhatsThis ( self, whatsThis: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_font *>
PROCEDURE QTableWidgetItem_font ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setFont *>
PROCEDURE QTableWidgetItem_setFont ( self, font: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_textAlignment *>
PROCEDURE QTableWidgetItem_textAlignment ( self: ADDRESS;
): C.int;

<* EXTERNAL QTableWidgetItem_setTextAlignment *>
PROCEDURE QTableWidgetItem_setTextAlignment ( self: ADDRESS;
alignment: C.int;
);

<* EXTERNAL QTableWidgetItem_backgroundColor *>
PROCEDURE QTableWidgetItem_backgroundColor ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setBackgroundColor *>
PROCEDURE QTableWidgetItem_setBackgroundColor ( self, color: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_background *>
PROCEDURE QTableWidgetItem_background ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setBackground *>
PROCEDURE QTableWidgetItem_setBackground ( self, brush: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_textColor *>
PROCEDURE QTableWidgetItem_textColor ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setTextColor *>
PROCEDURE QTableWidgetItem_setTextColor ( self, color: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_foreground *>
PROCEDURE QTableWidgetItem_foreground ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setForeground *>
PROCEDURE QTableWidgetItem_setForeground ( self, brush: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_checkState *>
PROCEDURE QTableWidgetItem_checkState ( self: ADDRESS;
): C.int;

<* EXTERNAL QTableWidgetItem_setCheckState *>
PROCEDURE QTableWidgetItem_setCheckState ( self: ADDRESS;
state: C.int;
);

<* EXTERNAL QTableWidgetItem_sizeHint *>
PROCEDURE QTableWidgetItem_sizeHint ( self: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidgetItem_setSizeHint *>
PROCEDURE QTableWidgetItem_setSizeHint ( self, size: ADDRESS;
);

<* EXTERNAL QTableWidgetItem_type *>
PROCEDURE QTableWidgetItem_type ( self: ADDRESS;
): C.int;

TYPE
QTableWidgetItem <: ADDRESS;

<* EXTERNAL New_QTableWidget0 *>
PROCEDURE New_QTableWidget0 ( parent: ADDRESS;
): QTableWidget;

<* EXTERNAL New_QTableWidget1 *>
PROCEDURE New_QTableWidget1 (): QTableWidget;

<* EXTERNAL New_QTableWidget2 *>
PROCEDURE New_QTableWidget2 (rows, columns: C.int;
 parent: ADDRESS;
): QTableWidget;

<* EXTERNAL New_QTableWidget3 *>
PROCEDURE New_QTableWidget3 (rows, columns: C.int;
): QTableWidget;

<* EXTERNAL Delete_QTableWidget *>
PROCEDURE Delete_QTableWidget ( self: QTableWidget;
);

<* EXTERNAL QTableWidget_setRowCount *>
PROCEDURE QTableWidget_setRowCount ( self: QTableWidget;
rows: C.int;
);

<* EXTERNAL QTableWidget_rowCount *>
PROCEDURE QTableWidget_rowCount ( self: QTableWidget;
): C.int;

<* EXTERNAL QTableWidget_setColumnCount *>
PROCEDURE QTableWidget_setColumnCount ( self: QTableWidget;
columns: C.int;
);

<* EXTERNAL QTableWidget_columnCount *>
PROCEDURE QTableWidget_columnCount ( self: QTableWidget;
): C.int;

<* EXTERNAL QTableWidget_row *>
PROCEDURE QTableWidget_row ( self: QTableWidget;
 item: ADDRESS;
): C.int;

<* EXTERNAL QTableWidget_column *>
PROCEDURE QTableWidget_column ( self: QTableWidget;
 item: ADDRESS;
): C.int;

<* EXTERNAL QTableWidget_item *>
PROCEDURE QTableWidget_item ( self: QTableWidget;
row, column: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_setItem *>
PROCEDURE QTableWidget_setItem ( self: QTableWidget;
row, column: C.int;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_takeItem *>
PROCEDURE QTableWidget_takeItem ( self: QTableWidget;
row, column: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_verticalHeaderItem *>
PROCEDURE QTableWidget_verticalHeaderItem ( self: QTableWidget;
row: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_setVerticalHeaderItem *>
PROCEDURE QTableWidget_setVerticalHeaderItem ( self: QTableWidget;
row: C.int;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_takeVerticalHeaderItem *>
PROCEDURE QTableWidget_takeVerticalHeaderItem ( self: QTableWidget;
row: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_horizontalHeaderItem *>
PROCEDURE QTableWidget_horizontalHeaderItem ( self: QTableWidget;
column: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_setHorizontalHeaderItem *>
PROCEDURE QTableWidget_setHorizontalHeaderItem ( self: QTableWidget;
column: C.int;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_takeHorizontalHeaderItem *>
PROCEDURE QTableWidget_takeHorizontalHeaderItem ( self: QTableWidget;
column: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_setVerticalHeaderLabels *>
PROCEDURE QTableWidget_setVerticalHeaderLabels ( self: QTableWidget;
 labels: ADDRESS;
);

<* EXTERNAL QTableWidget_setHorizontalHeaderLabels *>
PROCEDURE QTableWidget_setHorizontalHeaderLabels ( self: QTableWidget;
 labels: ADDRESS;
);

<* EXTERNAL QTableWidget_currentRow *>
PROCEDURE QTableWidget_currentRow ( self: QTableWidget;
): C.int;

<* EXTERNAL QTableWidget_currentColumn *>
PROCEDURE QTableWidget_currentColumn ( self: QTableWidget;
): C.int;

<* EXTERNAL QTableWidget_currentItem *>
PROCEDURE QTableWidget_currentItem ( self: QTableWidget;
): ADDRESS;

<* EXTERNAL QTableWidget_setCurrentItem *>
PROCEDURE QTableWidget_setCurrentItem ( self: QTableWidget;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_setCurrentItem1 *>
PROCEDURE QTableWidget_setCurrentItem1 ( self: QTableWidget;
 item: ADDRESS;
command: C.int;
);

<* EXTERNAL QTableWidget_setCurrentCell *>
PROCEDURE QTableWidget_setCurrentCell ( self: QTableWidget;
row, column: C.int;
);

<* EXTERNAL QTableWidget_setCurrentCell1 *>
PROCEDURE QTableWidget_setCurrentCell1 ( self: QTableWidget;
row, column, command: C.int;
);

<* EXTERNAL QTableWidget_sortItems *>
PROCEDURE QTableWidget_sortItems ( self: QTableWidget;
column, order: C.int;
);

<* EXTERNAL QTableWidget_sortItems1 *>
PROCEDURE QTableWidget_sortItems1 ( self: QTableWidget;
column: C.int;
);

<* EXTERNAL QTableWidget_setSortingEnabled *>
PROCEDURE QTableWidget_setSortingEnabled ( self: QTableWidget;
enable: BOOLEAN;
);

<* EXTERNAL QTableWidget_isSortingEnabled *>
PROCEDURE QTableWidget_isSortingEnabled ( self: QTableWidget;
): BOOLEAN;

<* EXTERNAL QTableWidget_editItem *>
PROCEDURE QTableWidget_editItem ( self: QTableWidget;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_openPersistentEditor *>
PROCEDURE QTableWidget_openPersistentEditor ( self: QTableWidget;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_closePersistentEditor *>
PROCEDURE QTableWidget_closePersistentEditor ( self: QTableWidget;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_cellWidget *>
PROCEDURE QTableWidget_cellWidget ( self: QTableWidget;
row, column: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_setCellWidget *>
PROCEDURE QTableWidget_setCellWidget ( self: QTableWidget;
row, column: C.int;
 widget: ADDRESS;
);

<* EXTERNAL QTableWidget_removeCellWidget *>
PROCEDURE QTableWidget_removeCellWidget ( self: QTableWidget;
row, column: C.int;
);

<* EXTERNAL QTableWidget_isItemSelected *>
PROCEDURE QTableWidget_isItemSelected ( self: QTableWidget;
 item: ADDRESS;
): BOOLEAN;

<* EXTERNAL QTableWidget_setItemSelected *>
PROCEDURE QTableWidget_setItemSelected ( self: QTableWidget;
 item: ADDRESS;
select: BOOLEAN;
);

<* EXTERNAL QTableWidget_setRangeSelected *>
PROCEDURE QTableWidget_setRangeSelected ( self: QTableWidget;
 range: ADDRESS;
select: BOOLEAN;
);

<* EXTERNAL QTableWidget_visualRow *>
PROCEDURE QTableWidget_visualRow ( self: QTableWidget;
logicalRow: C.int;
): C.int;

<* EXTERNAL QTableWidget_visualColumn *>
PROCEDURE QTableWidget_visualColumn ( self: QTableWidget;
logicalColumn: C.int;
): C.int;

<* EXTERNAL QTableWidget_itemAt *>
PROCEDURE QTableWidget_itemAt ( self: QTableWidget;
 p: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidget_itemAt1 *>
PROCEDURE QTableWidget_itemAt1 ( self: QTableWidget;
x, y: C.int;
): ADDRESS;

<* EXTERNAL QTableWidget_visualItemRect *>
PROCEDURE QTableWidget_visualItemRect ( self: QTableWidget;
 item: ADDRESS;
): ADDRESS;

<* EXTERNAL QTableWidget_itemPrototype *>
PROCEDURE QTableWidget_itemPrototype ( self: QTableWidget;
): ADDRESS;

<* EXTERNAL QTableWidget_setItemPrototype *>
PROCEDURE QTableWidget_setItemPrototype ( self: QTableWidget;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_scrollToItem *>
PROCEDURE QTableWidget_scrollToItem ( self: QTableWidget;
 item: ADDRESS;
hint: C.int;
);

<* EXTERNAL QTableWidget_scrollToItem1 *>
PROCEDURE QTableWidget_scrollToItem1 ( self: QTableWidget;
 item: ADDRESS;
);

<* EXTERNAL QTableWidget_insertRow *>
PROCEDURE QTableWidget_insertRow ( self: QTableWidget;
row: C.int;
);

<* EXTERNAL QTableWidget_insertColumn *>
PROCEDURE QTableWidget_insertColumn ( self: QTableWidget;
column: C.int;
);

<* EXTERNAL QTableWidget_removeRow *>
PROCEDURE QTableWidget_removeRow ( self: QTableWidget;
row: C.int;
);

<* EXTERNAL QTableWidget_removeColumn *>
PROCEDURE QTableWidget_removeColumn ( self: QTableWidget;
column: C.int;
);

<* EXTERNAL QTableWidget_clear *>
PROCEDURE QTableWidget_clear ( self: QTableWidget;
);

<* EXTERNAL QTableWidget_clearContents *>
PROCEDURE QTableWidget_clearContents ( self: QTableWidget;
);

TYPE
QTableWidget = ADDRESS;

END QtTableWidgetRaw.
