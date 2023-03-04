SCRIPTNAME RAHDOH_SCPT_DustyDoll Extends OBJECTREFERENCE

SOUND Property SweepSound Auto
FORMLIST Property ManagerList Auto
MISCOBJECT Property DustyDoll Auto
MISCOBJECT Property OrdinaryDoll Auto
GLOBALVARIABLE Property DollCount Auto
GLOBALVARIABLE Property IsRunning Auto

EVENT OnEquipped(ACTOR AkActor)

	IF ( AkActor == Game.GetPlayer() )
		IF ( IsRunning.GetValue() As INT == 0 )
			IsRunning.SetValue(1 As INT)
			INT ListSize = ManagerList.GetSize()

			IF ( ListSize > 0 )
				AkActor.RemoveItem(DustyDoll, 1, True)
				SweepingSound(Utility.RandomInt(2, 4))
				Utility.Wait(0.15)
				FORM Doll = ManagerList.GetAt(Utility.RandomInt(0, ListSize))
				Utility.Wait(0.15)
				ManagerList.RemoveAddedForm(Doll)
				AkActor.AddItem(Doll)
				DollCount.SetValue(((DollCount.GetValue() As INT) + 1) As INT)
			ELSE
				AkActor.RemoveItem(DustyDoll, 1, True)
				Utility.Wait(0.15)
				SweepingSound(Utility.RandomInt(2, 4))
				Utility.Wait(0.15)
				AkActor.AddItem(OrdinaryDoll)
				DollCount.SetValue(((DollCount.GetValue() As INT) + 1) As INT)
			ENDIF
			
		ENDIF
	ENDIF
	
ENDEVENT
 


FUNCTION SweepingSound(INT TimesToPlay = 1)

	WHILE ( TimesToPlay > 0 )
		SweepSound.PlayAndWait(Game.GetPlayer())
		TimesToPlay -= 1
	ENDWHILE
	
	IsRunning.SetValue(0 As INT)
	
ENDFUNCTION