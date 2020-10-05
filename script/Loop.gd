extends StaticBody2D

export(float) var rotation_speed = 1
export(float) var rotation_sensitivity = 0.3
var rotation_direction = 0

var control = false
var startAngle
var endAngle

export (int) var number_of_slimes
var slimes_inside = []
var slime_to_look = null
var lock = false

func _ready():
	pass

func _process(delta):
	if control == true:
		if Input.is_action_pressed("click"):
			if not startAngle:
				startAngle = rad2deg(global_position.angle_to_point(get_global_mouse_position()))
			endAngle = rad2deg(global_position.angle_to_point(get_global_mouse_position()))
#			rotation_degrees = lerp_angle(rotation_degrees,rotation_degrees- (startAngle - endAngle),rotation_sensitivity)
#			rotation_degrees -= startAngle - endAngle
			#clamp rotation
			rotation_degrees -= clamp(startAngle - endAngle,-1.5,1.5)
			print(startAngle - endAngle)
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
		
	for slime in slimes_inside:
		if slime == null:
			continue
		slime_to_look = slime
		if slime.slime_nearby > slime_to_look.slime_nearby:
			slime_to_look = slime
	if slime_to_look != null:
		$EyeNode.look_at(slime_to_look.global_position)
	pass

func blockade():
	$AnimationPlayer.play("open")
	print("open")
	pass


func _on_slime_scanner_body_entered(body):
	if body.is_in_group("slime"):
		number_of_slimes -= 1
		slimes_inside.append(body)
	#close gate when everyone is inside
		if number_of_slimes <= 0 && lock == false:
			lock = true
			$Blockade/slime_scanner.monitoring = false
			$AnimationPlayer.play_backwards("open")
	pass # Replace with function body.

