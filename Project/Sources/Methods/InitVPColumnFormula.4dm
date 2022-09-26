//%attributes = {}
var $area; $js : Text
var $data : Object
var $parameters : Object

$area:="VPColumnFormula"

AddRemoveBtDisplaying(True:C214)

// Changes the ribbon design 
//$js:="designer.setConfig(GC.Spread.Sheets.Designer.ToolBarModeConfig);"
$js:="designer.setData('isRibbonCollapse',true);"
WA Evaluate JavaScript:C1029(*; $area; $js)

Form:C1466.currentInvoice:=ds:C1482.People.all().first()

// Creation of the object to bind to the datacontext
Form:C1466.data:=New object:C1471
Form:C1466.data.VAT:=0.05
Form:C1466.data.Invoices:=Form:C1466.currentInvoice.link_Invoices.toCollection()

VP SET DEFAULT STYLE($area; New object:C1471("formatter"; "$ ### ###.00"))
VP SET CELL STYLE(VP Column($area; 4); New object:C1471("formatter"; "##.00 %"))
VP SET CELL STYLE(VP Column($area; 1); New object:C1471("formatter"; "### ###.00"))
VP SET CELL STYLE(VP Cell($area; 1; 0); New object:C1471("formatter"; "##.00 %"))

VP SET TEXT VALUE(VP Cell($area; 0; 0); "VAT:")
VP SET BINDING PATH(VP Cell($area; 1; 0); "VAT")

// Inits table parameters
$parameters:=New object:C1471

$parameters.showFooter:=True:C214
$parameters.useFooterDropDownList:=False:C215
// Inits the columns of the table
$parameters.tableColumns:=New collection:C1472
$parameters.tableColumns.push(New object:C1471("dataField"; "Description"; "name"; "Description"))
$parameters.tableColumns.push(New object:C1471("dataField"; "Weight"; "name"; "Weight"))

// Creates the table
VP CREATE TABLE(VP Cells($area; 0; 3; $parameters.tableColumns.length; 1); "Invoices"; "Invoices"; $parameters)



// Sets the datacontext with the collection created above
VP SET DATA CONTEXT($area; Form:C1466.data)

VP COLUMN AUTOFIT(VP Column($area; 0; 3))