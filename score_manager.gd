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
