extends StaticBody2D

var rotation_movement = 0
func _ready():
	pass

func _input(event):
	if Input.is_action_pressed("rotate_clockwise") && Input.is_action_pressed("rotate_counterclockwise"):
		rotation_movement = 0
	elif Input.is_action_pressed("rotate_clockwise"):
		rotation_movement = 1
	elif Input.is_action_pressed("rotate_counterclockwise"):
		rotation_movement = -1
	else:
		rotation_movement = 0

func _physics_process(delta):
	rotation_degrees += rotation_movement
	pass
