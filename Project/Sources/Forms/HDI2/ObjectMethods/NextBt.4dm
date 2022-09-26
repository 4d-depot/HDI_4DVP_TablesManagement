var $area : Text
$area:="VPColumnFormula"

Form:C1466.currentInvoice:=Form:C1466.currentInvoice.next() || Form:C1466.currentInvoice.first()
Form:C1466.data.Invoices:=Form:C1466.currentInvoice.next().link_Invoices.toCollection()

// Load the next record in the datacontext 
VP SET DATA CONTEXT($area; Form:C1466.data)