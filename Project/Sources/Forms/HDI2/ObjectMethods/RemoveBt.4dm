
var $area; $tableName : Text
var $param : Object
var $id : Integer

If (Form:C1466.trace)
	TRACE:C157
End if 

$area:="VPColumnFormula"
$tableName:="Invoices"

// Search the column id according the column name
$id:=VP Get table column index($area; $tableName; "Weight price")
// Remove the column by id
VP REMOVE TABLE COLUMNS($area; $tableName; $id)

// Search the column id according the column name
$id:=VP Get table column index($area; $tableName; "Total without taxes")
// Remove the column by id
VP REMOVE TABLE COLUMNS($area; $tableName; $id)

// Search the column id according the column name
$id:=VP Get table column index($area; $tableName; "VAT")
// Remove the column by id
VP REMOVE TABLE COLUMNS($area; $tableName; $id)

// Search the column id according the column name
$id:=VP Get table column index($area; $tableName; "Total Price")
// Remove the column by id
VP REMOVE TABLE COLUMNS($area; $tableName; $id)

// Resize the columns 
VP COLUMN AUTOFIT(VP Column($area; 0; 6))

AddRemoveBtDisplaying(True:C214)

