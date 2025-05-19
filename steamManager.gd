extends Control

var PORT_NUMBER = 25565
func _ready() -> void:
	Steam.steamInit()
	
	var steamRunning = Steam.isSteamRunning()
	if !steamRunning:
		print("Steam is not currently running")
		return
	
	var userId = Steam.getSteamID()
	var name = Steam.getFriendPersonaName(userId)
	print("Steam name: " + name)
	
	var peer : MultiplayerPeer = ENetMultiplayerPeer.new()
	
	peer.create_server(PORT_NUMBER)
	
	multiplayer.multiplayer_peer = peer
