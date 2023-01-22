extends KinematicBody2D

const GRAVITY = 4000
export (int) var speed = 100
var velocity = Vector2()


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	velocity.y += delta * GRAVITY
	velocity = move_and_slide(velocity)


func _input(event):
	if event.is_action_pressed("mouse_click"):
		print("shoot")

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
