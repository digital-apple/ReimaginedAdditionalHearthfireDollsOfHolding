SCRIPTNAME RAHDOH_SCPT_Player Extends REFERENCEALIAS

SPELL Property Ability Auto
FORMLIST Property DollList Auto
FORMLIST Property ManagerList Auto
RAHDOH_SCPT_Maintenance Property Maintenance Auto

EVENT OnInit()

	IF ( !Game.GetPlayer().HasSpell(Ability) )
		Game.GetPlayer().AddSpell(Ability, False)
	ENDIF

	INT Index = 0
	
	WHILE ( Index <= DollList.GetSize() )
		ManagerList.AddForm(DollList.GetAt(Index))
		Index += 1
	ENDWHILE

ENDEVENT 



EVENT OnPlayerLoadGame()
	Maintenance.Maintenance()
ENDEVENT