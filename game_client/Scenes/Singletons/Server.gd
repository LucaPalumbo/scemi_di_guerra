extends Node

var network = NetworkedMultiplayerENet.new()
var ip = "127.0.0.1"
var port = 1909


func _ready():
	ConnectToServer()

func ConnectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_succeeded", self, "OnConnectionSucceeded")
	network.connect("connection_failed", self, "OnConnectionFailed")

func OnConnectionSucceeded():
	print("Connected")
	
func OnConnectionFailed():
	print("Failed....")


func FetchMessage(message, requester):
	print("eseguendo fetch message")
	rpc_id(1, "FetchMessage", message, requester)

remote func ReturnMessage(message, requester):
	instance_from_id(requester).testConnection2(message)
	
