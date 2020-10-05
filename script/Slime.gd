extends RigidBody2D

var slime_nearby = 1

func killed():
	$AnimationPlayer.play("pop")

func _process(delta):
	slime_nearby = check_nearby_slime() + 1
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "pop":
		self.queue_free()


func _on_Slime_body_entered(body):
	$particles.restart()
	pass # Replace with function body.
	
func check_nearby_slime():
	var number_of_slime = 0
	for slime in $peer.get_overlapping_bodies():
		if slime.is_in_group("slime"):
			number_of_slime += 1
	return number_of_slime
