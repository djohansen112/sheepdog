extends Area2D

func _physics_process(delta: float) -> void:
	var friends_in_range = get_overlapping_bodies()
	if friends_in_range.size() > 0:
		var target_friend = friends_in_range.front()
		look_at(target_friend.global_position)
