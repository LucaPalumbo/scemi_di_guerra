extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_player = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	StartServer()
	

func StartServer():
	network.create_server(port, max_player)
	get_tree().set_network_peer(network)
	
	print("Server Started...")
	
	network.connect("peer_connected", self, "Peer_Connected")
	network.connect("peer_disconnected", self, "Peer_Disconnected")
	
func Peer_Connected(player_id):
	print("User "+str(player_id)+" Connected")
	
func Peer_Disconnected(player_id):
	print("User "+str(player_id)+" Disconnected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
