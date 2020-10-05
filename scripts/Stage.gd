extends Node2D

onready var loop = $Loop


func _ready():
	pass

func start_game():
	loop.blockade()
	loop.control = true
	pass

func game_end():
	get_node("AnimationPlayer").play("time_out")
	loop.control = false
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "camera_pan":
		start_game()
	if anim_name == "time_out":
		get_tree().change_scene("res://scenes/Credits.tscn")
	pass
