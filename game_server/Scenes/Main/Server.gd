extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_player = 100


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


remote func FetchMessage(message, requester):
	var player_id = get_tree().get_rpc_sender_id()
	var m = ServerData.data[message]
	rpc_id(player_id, "ReturnMessage", m, requester)
	print("Sent " + str(m) + " to " + str(player_id) )
