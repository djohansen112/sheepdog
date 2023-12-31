
#Needs to have a threat level and radius. Needs a speed and a sprite. 
#Sprite should point around depending on the direcion. A bark mechanic 
#might be able to add a stress level or points towards so the dog can 
#induce the next behaviour level. Need to have a movement and a bark. 

extends CharacterBody2D

@export var speed = 400
@onready var player = $"player-sprite"

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		player.play("player-walk-left")
	elif Input.is_action_pressed("ui-right"):
		player.play("player-walk-right")
	elif Input.is_action_pressed("ui_up"):
		player.play("player-walk-up")
	elif Input.is_action_pressed("ui_down"):
		player.play("player-walk-down")
	else:
		player.play("player-idle-stand")		
	
func _physics_process(delta):
	get_input()
	move_and_slide()

