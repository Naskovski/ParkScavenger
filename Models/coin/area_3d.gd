extends Area3D

func _ready():
	connect("body_entered", _on_body_entered)  

func _on_body_entered(body):
	if body.is_in_group("player"):  
		ScoreManager.add_score(1)   
		queue_free()
