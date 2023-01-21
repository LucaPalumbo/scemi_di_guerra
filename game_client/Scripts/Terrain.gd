extends CollisionPolygon2D


var collision_holder : Node2D
var world_size : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("destructibles")
	world_size = (get_parent() as Sprite2D).get_rect().size



func build_collisions_from_image():	
	# Create bitmap from the SubViewport (which projects into our sprite)
	var bitmap := BitMap.new()
	bitmap.create_from_image_alpha($Sprite2D.texture.get_image())
	
	# DEBUG:
	#$Sprite2D.get_texture().get_data().save_png("res://screenshots/debug" + get_parent().name + ".png")
	#print("Saved")

	# This will generate polygons for the given coordinate rectangle within the bitmap
	# In our case, our given coordinates are the entire image.
	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0,0), bitmap.get_size()))

	# Now create a collision polygon for each polygon returned
	# For the most part there will probably only be one.... unless you have islands
	for polygon in polygons:
		var collider := CollisionPolygon2D.new()

		# Remap our points from the viewport coordinates back to world coordinates.
		var newpoints := Array()
		for point in polygon:
			newpoints.push_back(_viewport_to_world(point))
		collider.polygon = newpoints
		collision_holder.add_child(collider)


func _viewport_to_world(point : Vector2) -> Vector2:
	var dynamic_texture_size = $SubViewport.get_size()
	return Vector2(
		((point.x + get_viewport_rect().position.x) / dynamic_texture_size.x) * world_size.x,
		((point.y + get_viewport_rect().position.y) / dynamic_texture_size.y) * world_size.y
	)

