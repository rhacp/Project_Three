class_name Fall
extends State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

@export_group("Jump")
@export var player : CharacterBody2D

# 1. enter state
func enter_state():
	animated_sprite_2d.play("fall")
	
# 2. update, do stuff
func update(delta : float):
	if !player.is_on_floor():
		player.velocity.y += player.gravity * delta
	
	if (!player.is_on_floor() && InputManager.get_input_jump() && player.jump_counter < player.jump_limit):
		player.velocity.y = player.JUMP_VELOCITY
		player.jump_counter += 1
		
	var direction = InputManager.get_direction()
	
	# movement
	if (direction):
		player.velocity.x = direction * player.SPEED
		
	# change animation
	if (direction == -1):
		animated_sprite_2d.flip_h = true
	if (direction == 1):
		animated_sprite_2d.flip_h = false
		
	if (player.is_on_floor()):
		transition.emit("Idle")
	
# 3. exist state, transition
func exit_state():
	player.jump_counter = 0
	player.velocity.x = 0
	animated_sprite_2d.stop()
