extends Control

var main_scene = null

func _ready() -> void:
	ResourceLoader.load_threaded_request("res://main_scene.tscn")

func _on_start_button_pressed() -> void:
	if ResourceLoader.load_threaded_get_status("res://main_scene.tscn") == ResourceLoader.THREAD_LOAD_LOADED:
		main_scene = ResourceLoader.load_threaded_get("res://main_scene.tscn")
	else:
		main_scene = load("res://main_scene.tscn")
	
	TimerManager.reset_timer()
	get_tree().change_scene_to_packed(main_scene)

func _on_exit_button_pressed() -> void:
	get_tree().quit()
