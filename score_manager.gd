extends Node

var score: int = 0
var max_score: int = 5
var ui: Node = null

func set_ui(ui_node: Node):
	ui = ui_node 

func add_score(points: int):
	score += points
	if ui:
		ui.update_score(score)
		
	if score == 5:
		get_tree().change_scene_to_file("res://game_over.tscn")
		
func reset():
	score = 0;
