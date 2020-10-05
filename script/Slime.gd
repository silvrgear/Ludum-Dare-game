extends RigidBody2D

func killed():
	$AnimationPlayer.play("pop")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "pop":
		self.queue_free()


func _on_Slime_body_entered(body):
	$particles.restart()
	pass # Replace with function body.
