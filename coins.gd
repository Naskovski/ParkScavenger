extends Node3D

@export var coin_scene: PackedScene
@export var max_coins: int = 5 

func _ready():
	spawn_random_coins()

func spawn_random_coins():
	var spawn_points = get_children().duplicate()
	spawn_points.shuffle()

	for i in range(min(max_coins, spawn_points.size())):
		var spawn_point = spawn_points[i]
		var coin = coin_scene.instantiate()
		add_child(coin)
		coin.global_transform.origin = spawn_point.global_transform.origin
