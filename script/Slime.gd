extends RigidBody2D

func killed():
	self.queue_free()
