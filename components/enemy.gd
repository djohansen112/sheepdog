extends Area2D

const SPEED = 4000
var direction = Vector2(10, 20)
var home = Vector2(100, 100)
enum States {IDLE, SCARED, HOME}
@export var state: States = States.IDLE

func _ready() -> void:
	_new_direction()
	$Sheep/Move_Timer.start(0.2)
	
func _physics_process(delta):
#Sheep has three states - idle, scared, home
	#match state:
		#States.IDLE:
		##Sheep wanders the level
	velocity = direction * SPEED * delta
	move_and_slide()
		#States.SCARED:
		##Sheep runs away from Player
			#direction = -global_position.direction_to(player object)
##			call a state change and then pass it the current state and then move it back to idle, need to make it scared just for a few secs.
#		#States.HOME:
		##Sheep is in the pen so idle animation is eating grass and less walking
			#direction = global_position.direction_to(home)
			#velocity = direction * SPEED/10 * delta
			#move_and_slide()
			
#Animations
	var anim_direction = abs(direction)
	if anim_direction.x > anim_direction.y:
		if anim_direction.x > 0:
			$AnimatedSprite2D.play("walk_down")
		elif anim_direction.x < 0:
			$AnimatedSprite2D.play("walk_up")
	elif anim_direction.x < anim_direction.y:
		if anim_direction.y > 0:
			$AnimatedSprite2D.play("walk_side")
			$AnimatedSprite2D.flip_h = true	
		elif anim_direction.y < 0:
			$AnimatedSprite2D.play("walk_side")
			$AnimatedSprite2D.flip_h = false	
	else:
		$AnimatedSprite2D.play("idle")

func _on_level_boundary_body_exited(body: Node2D) -> void:
	direction = global_position.direction_to(home)
	print("Oops, out of bounds!")
	$Move_Timer.start(4)

func _new_direction() -> Vector2:
	var new_direction = Vector2(randi_range(-100, 100), randi_range(-100, 100))
	direction = new_direction.normalized()
	return direction
	
func _on_move_timer_timeout() -> void:
	_new_direction()
	var time = randi_range(0.5, 4)
	$Move_Timer.start(time)
	
#func _on_enemy_zone_body_entered(body: Node2D) -> void:
	#state = States.SCARED
	#print("Ahh, I'm scared!")
