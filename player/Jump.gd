class_name Jump
extends State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

@export_group("Jump")
@export var player : CharacterBody2D

# 1. enter state
func enter_state():
	animated_sprite_2d.play("jump")
	
# 2. update, do stuff
func update(delta : float):
	#if (!player.is_on_floor()):
		#player.velocity.y += player.gravity * delta
	
	# first jump
	if (player.is_on_floor()):
		player.velocity.y = player.JUMP_VELOCITY
		player.jump_counter += 1
		
	# second jump
	if (!player.is_on_floor() && InputManager.get_input_jump() && player.jump_counter < player.jump_limit):
		player.velocity.y = player.JUMP_VELOCITY
		player.jump_counter += 1
		
	# get direction in air
	var direction = InputManager.get_direction()
	
	# movement in air
	if (direction && player.ignore_input == false):
		player.velocity.x = direction * player.SPEED
		
	# change animation in air
	if (direction == -1 && player.ignore_input == false):
		animated_sprite_2d.flip_h = true
	if (direction == 1 && player.ignore_input == false):
		animated_sprite_2d.flip_h = false
		
	# transition to fall
	if player.velocity.y > 0:
		transition.emit("Fall")
		
	player.move_and_slide()
	
# 3. exist state, transition
func exit_state():
	animated_sprite_2d.stop()
