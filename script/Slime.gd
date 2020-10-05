extends RigidBody2D

var slime_nearby = 1

func killed():
	$AnimationPlayer.play("pop")

func _physics_process(delta):
	slime_nearby += len($peer.get_overlapping_bodies())
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "pop":
		self.queue_free()


func _on_Slime_body_entered(body):
	$particles.restart()
	pass # Replace with function body.
