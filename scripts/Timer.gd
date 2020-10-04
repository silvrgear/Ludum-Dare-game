extends Label

onready var timer = $Timer
var minutes = 1
var seconds = 60

func _ready():
	pass

func _on_Timer_timeout():
	seconds -= 1
	if minutes >= 1:
		if seconds == 0:
			minutes -= 1
			seconds = 59
	if minutes == 0 and seconds == 0:
		print("time out!")
		timer.stop()
		get_parent().get_parent().game_end()
	self.text = str(minutes).pad_zeros(2) + " : " + str(seconds).pad_zeros(2)
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "camera_pan":
		timer.start()
	pass # Replace with function body.
