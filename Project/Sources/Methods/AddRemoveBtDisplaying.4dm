//%attributes = {}
#DECLARE($enableAddButton : Boolean)
// Manage the displaying of the buttons

OBJECT SET ENABLED:C1123(*; "AddBt"; $enableAddButton)
OBJECT SET ENABLED:C1123(*; "RemoveBt"; Not:C34($enableAddButton))