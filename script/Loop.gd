extends StaticBody2D

export(int) var rotation_speed = 1
var rotation_direction = 0
func _ready():
	pass

func _input(event):
	if Input.is_action_pressed("rotate_clockwise") && Input.is_action_pressed("rotate_counterclockwise"):
		rotation_direction = 0
	elif Input.is_action_pressed("rotate_clockwise"):
		rotation_direction = 1
	elif Input.is_action_pressed("rotate_counterclockwise"):
		rotation_direction = -1
	else:
		rotation_direction = 0

func _physics_process(delta):
	rotation_degrees += rotation_direction * rotation_speed
	pass
