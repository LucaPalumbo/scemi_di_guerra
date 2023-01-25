extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var data

# Called when the node enters the scene tree for the first time.
func _ready():
	var data_file = File.new()
	data_file.open("res://Data/data.json", File.READ)
	var data_json = JSON.parse( data_file.get_as_text() )
	data_file.close()
	data = data_json.result
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
