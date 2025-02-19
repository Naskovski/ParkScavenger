extends Control

var ui: Node = null

func set_ui(ui_node: Node):
	ui = ui_node 
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func format_time(seconds: int) -> String:
	var minutes = seconds / 60
	var remaining_seconds = seconds % 60
	return "%02d:%02d" % [minutes, remaining_seconds]  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ui and $Timer:
		ui.update_time("test" + format_time($Timer.time_left))


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://game_over.tscn")
