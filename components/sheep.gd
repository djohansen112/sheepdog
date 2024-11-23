extends CharacterBody2D

const SPEED = 3000
const RUN = 8000
var direction: Vector2 = Vector2.ZERO
var state: String = "IDLE"
var threat = false

@onready var player = get_node("/root/Level/Player")
@onready var _animation = $AnimationTree

func _ready() -> void:
	$Behave_Timer.start(0.2)
	
func _physics_process(delta: float) -> void:
	
	velocity = direction * SPEED * delta
	if state == "SCARED":
		direction = -global_position.direction_to(player.global_position)
	elif state == "PANIC":
		direction = -global_position.direction_to(player.global_position)
		velocity = direction * RUN * delta
	move_and_slide()
	_animation["parameters/walk/blend_position"] = direction
	
func random_direction() -> Vector2:
	var new_direction = Vector2(randi_range(-100, 100), randi_range(-100, 100))
	direction = new_direction.normalized()
	return direction
	
func _on_behave_timer_timeout() -> void:
	if state == "IDLE":
		direction = random_direction()
		print("I'm Idle")
	elif state == "SCARED":
		print("I'm so scared!")
		if threat == true:
			state="SCARED"		
		else:
			state = "IDLE"
	elif state == "PANIC":
		print("HOLYYY JEEBUSSS!")
		if threat == true:
			state="PANIC"		
		else:
			state = "SCARED"
	elif state == "HOME":
		direction = global_position.direction_to(player.global_position)
		print("I'm home")
	reset_timer()
	
func reset_timer(range_lower:float = 0.5, range_upper: float = 3) -> void:
	var time = randf_range(range_lower, range_upper)
	$Behave_Timer.start(time)
	print("time was ", time)

func _on_threat_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("Ahhh! Scary!")
	state = "SCARED"
	threat = true
	reset_timer()

func _on_threat_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("phew! Safe again")
	if state != "PANIC":
		state = "IDLE"
	threat = false
	reset_timer()

func _on_player_borked() -> void:
	if state == "SCARED" or threat == true:
		state = "PANIC"
		reset_timer(3, 4)
