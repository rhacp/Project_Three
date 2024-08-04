class_name Run
extends State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

@export var player : CharacterBody2D

# 1. enter state
func enter_state():
	animated_sprite_2d.play("run")
	
# 2. update, do stuff
func update(delta : float):
	var direction = InputManager.get_direction()
	
	# movement
	if (direction):
		player.velocity.x = direction * player.SPEED
		animated_sprite_2d.play("run")
	
	if (!direction):
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		#player.velocity.x = 0
		animated_sprite_2d.play("idle")
		
	# change animation
	if (direction == -1):
		animated_sprite_2d.flip_h = true
	if (direction == 1):
		animated_sprite_2d.flip_h = false
		
	# transition to jump
	if (InputManager.get_input_jump()):
		transition.emit("Jump")
		
	# transition to fall
	#if (!player.is_on_floor()):
		#transition.emit("Fall")
	
	player.move_and_slide()
	
# 3. exist state, transition
func exit_state():
	animated_sprite_2d.stop()
