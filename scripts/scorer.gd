extends Area2D

var score = 0

func _ready():
	pass


func _on_AreaScore_body_entered(body):
	if body.is_in_group("slime"):
		score += 1
	
	get_parent().get_node("Label").text = "Score: " + str(score)
