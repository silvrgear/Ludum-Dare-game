extends Control

func _ready():
	pass


func _on_StartBtn_button_up():
	get_tree().change_scene("res://scenes/Stage.tscn")
	pass


func _on_QuitBtn_button_up():
	get_tree().quit()
	pass
