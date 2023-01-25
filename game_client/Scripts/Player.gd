extends KinematicBody2D

export (PackedScene) var cannonBall = preload("res://Scenes/Main/SimpleBullet.tscn")

const GRAVITY = 4000
export (int) var speed = 100
var velocity = Vector2()
onready var cannonBalls = get_parent().get_node("CannonBalls")


func _ready():
	pass 

func _physics_process(delta):
	get_input()
	velocity.y += delta * GRAVITY
	velocity = move_and_slide(velocity)
 

func _input(event):
	if event.is_action_pressed("mouse_click"):
		var ball = cannonBall.instance()
		ball.global_position = $Position2D.global_position
		cannonBalls.add_child(ball)
		ball.linear_velocity = Vector2(0,-200)
		print("shoot")
		
		testConnection()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed



func testConnection():
	print("Eserguendo test connection")
	Server.FetchMessage("message", get_instance_id() )

func testConnection2(message):
	print("Arrived: " + message)
