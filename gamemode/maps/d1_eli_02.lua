NEXT_MAP = "d1_town_01"

TRIGGER_CHECKPOINT = {
	{ Vector( -1939, 1833, -2736 ), Vector( -1897, 2001, -2629 ) }
}


-- Player spawns
function hl2cPlayerSpawn( ply )

	ply:Give( "weapon_crowbar" )
	ply:Give( "weapon_pistol" )
	ply:Give( "weapon_smg1" )
	ply:Give( "weapon_357" )
	ply:Give( "weapon_frag" )
	ply:Give( "weapon_physcannon" )	

end
hook.Add( "PlayerSpawn", "hl2cPlayerSpawn", hl2cPlayerSpawn )


-- Initialize entities
function hl2cMapEdit()

	ents.FindByName( "global_newgame_template_ammo" )[ 1 ]:Remove()
	ents.FindByName( "global_newgame_template_base_items" )[ 1 ]:Remove()
	ents.FindByName( "global_newgame_template_local_items" )[ 1 ]:Remove()

	if ( !game.SinglePlayer() ) then
	
		ents.FindByName( "brush_doorAirlock_PClip_2" )[ 1 ]:Remove()
	
	end

end
hook.Add( "MapEdit", "hl2cMapEdit", hl2cMapEdit )


-- Accept input
function hl2cAcceptInput( ent, input )

	if ( !game.SinglePlayer() && ( ( ent:GetName() == "airlock_south_door_exit" ) || ( ent:GetName() == "airlock_south_door_exitb" ) ) && ( string.lower( input ) == "close" ) ) then
	
		return true
	
	end

	if ( !game.SinglePlayer() && ( ent:GetName() == "command_physcannon" ) && ( string.lower( input ) == "command" ) ) then
	
		for _, ply in pairs( player.GetAll() ) do
		
			ply:Give( "weapon_physcannon" )
		
		end
	
	end

end
hook.Add( "AcceptInput", "hl2cAcceptInput", hl2cAcceptInput )
