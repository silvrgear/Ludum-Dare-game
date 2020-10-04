extends StaticBody2D

export(int) var rotation_speed = 1
var rotation_direction = 0

var control = false
var startAngle
var endAngle

func _ready():
	pass

func _process(delta):
	if control == true:
		if Input.is_action_pressed("click"):
			if not startAngle:
				startAngle = rad2deg(global_position.angle_to_point(get_global_mouse_position()))
			endAngle = rad2deg(global_position.angle_to_point(get_global_mouse_position()))
			rotation_degrees -= startAngle - endAngle
			startAngle = endAngle
	
		if Input.is_action_just_released("click"):
			startAngle = null
			endAngle = null


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
	if control == true:
		rotation_degrees += rotation_direction * rotation_speed
	pass

func blockade():
	$AnimationPlayer.play("move")
	pass
