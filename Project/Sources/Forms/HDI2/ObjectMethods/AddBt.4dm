
var $area; $tableName : Text
var $param : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$area:="VPColumnFormula"
$tableName:="Invoices"

// Adds 4 columns to the "Invoices" table
VP INSERT TABLE COLUMNS($area; $tableName; 1; 4; vk table insert after:K89:155)


// Write in the footer of the first column the text: "Total"
$param:=New object:C1471
$param.footerText:="Total"
VP SET TABLE COLUMN ATTRIBUTES($area; $tableName; 0; $param)

// Column 0:
// Add a formula in the footer of the Weight column to calculate the column total
$param:=New object:C1471
$param.footerFormula:="=SUM(Invoices[Weight])"
VP SET TABLE COLUMN ATTRIBUTES($area; $tableName; 1; $param)

// Column 2:
// Change the name of the column to "Weight price"
// and bind the column to the field "Price"
$param:=New object:C1471
$param.name:="Weight price"
$param.dataField:="Price"
VP SET TABLE COLUMN ATTRIBUTES($area; $tableName; 2; $param)

// Update the datacontext to force the refresh of the column with the new binding
VP SET DATA CONTEXT($area; VP Get data context($area))

// Column 3:
// Change the name of the column to "Total without taxes" 
// Add a formula that calculates the total price without taxes for each row of the table
// Add a formula in the footer to caclulate the total price without taxes
$param:=New object:C1471
$param.name:="Total without taxes"
$param.formula:="=[Weight Price]*[Weight]"
$param.footerFormula:="=SUM(Invoices[Total without taxes])"
VP SET TABLE COLUMN ATTRIBUTES($area; $tableName; 3; $param)

// Column 4:
// Change the name of the column to "VAT" 
// Add a formula to insert the taxe rate
// Hide the filter button in the column header
$param:=New object:C1471
$param.name:="VAT"
$param.formula:="=$B$1"
$param.filterButtonVisible:=False:C215
VP SET TABLE COLUMN ATTRIBUTES($area; $tableName; 4; $param)

// Column 5:
// Change the name of the column to "Total Price" 
// Add a formula that calculates the total price including taxes for each row of the table
// Add a formula in the footer to caclulate the total price including taxes
$param:=New object:C1471
$param.name:="Total Price"
$param.formula:="=[Total without taxes]*(1+([VAT]))"
$param.footerFormula:="=SUM(Invoices[Total Price])"
VP SET TABLE COLUMN ATTRIBUTES($area; $tableName; 5; $param)

// Calculate the size of the column
VP COLUMN AUTOFIT(VP Column($area; 0; 6))

AddRemoveBtDisplaying(False:C215)
OBJECT SET ENABLED:C1123(*; "NextBt"; True:C214)

