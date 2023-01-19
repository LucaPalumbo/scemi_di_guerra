extends Node

var network = NetworkedMultiplayerENet.new()
var ip = "127.0.0.1"
var port = 1909



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ConnectToServer() # Replace with function body.

func ConnectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_succeeded", self, "OnConnectionSucceeded")
	network.connect("connection_failed", self, "OnConnectionFailed")

func OnConnectionSucceeded():
	print("Connected")
	
func OnConnectionFailed():
	print("Failed....")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
