extends Area2D



func _on_Spike_body_entered(body):
	if body.is_in_group("slime"):
		body.killed()
	pass # Replace with function body.
