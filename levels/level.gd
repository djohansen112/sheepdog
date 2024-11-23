extends Node2D
#@onready var SHEEP = preload("res://components/enemy.tscn")
#@onready var PLAYER = preload("res://components/player.tscn")

func _ready() -> void:
	pass
#
	#var new_player = PLAYER.instantiate()
	#$Players.add_child(new_player)
#
	#var new_sheep = SHEEP.instantiate()
	#var random_position = Vector2(randi_range(0, 100), randi_range(0, 500))
	#new_sheep.global_position = random_position
	#$Sheep.add_child(new_sheep)
	
func _process(delta: float) -> void:
	pass


func _on_level_boundary_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
