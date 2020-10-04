extends CanvasLayer

func _ready():
	var t_slimes = get_parent().get_node("Slimes").get_child_count()
	$TotalSlimes.text = "Total Slimes: " + str(t_slimes)
	pass


func _on_Button_button_up():
	$ColorRect.queue_free()
	$Button.disabled = true
	$Button.visible = false
