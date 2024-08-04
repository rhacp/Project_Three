class_name Death
extends State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

@export var player : CharacterBody2D

# 1. enter state
func enter_state():
	animated_sprite_2d.play("death")
	
# 2. update, do stuff
func update(delta : float):
	#player.reset_health()
	#transition.emit("Idle")
	player.bounce_player = false
	
# 3. exist state, transition
func exit_state():
	animated_sprite_2d.stop()
