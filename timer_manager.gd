extends Node

var ui: Node = null
var time: float = 0.0

func set_ui(ui_node: Node):
	ui = ui_node 
	
func remove_ui():
	ui = null
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func format_time(seconds: int) -> String:
	var minutes = seconds / 60
	var remaining_seconds = seconds % 60
	return "%02d:%02d" % [minutes, remaining_seconds]  

func reset_timer() -> void:
	time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if ui and is_instance_valid(ui):
		ui.update_timer(format_time(120-time))


func _on_timer_timeout() -> void:
	remove_ui()
	get_tree().change_scene_to_file("res://game_over.tscn")
