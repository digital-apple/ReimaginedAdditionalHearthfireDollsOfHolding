SCRIPTNAME RAHDOH_SCPT_Maintenance Extends QUEST

GLOBALVARIABLE Property IsRunning Auto
MISCOBJECT Property DustyDoll Auto

FUNCTION Maintenance()

	IF ( IsRunning.GetValue() As INT == 1 )
		IsRunning.SetValue(0 As INT)
	ENDIF

	INT DollCount = Game.GetPlayer().GetItemCount(DustyDoll)

	IF ( DollCount > 0 )
		Game.GetPlayer().RemoveItem(DustyDoll, DollCount, True)
		Game.GetPlayer().AddItem(DustyDoll, DollCount, True)
	ENDIF

ENDFUNCTION