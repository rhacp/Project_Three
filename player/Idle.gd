class_name Idle
extends State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

# 1. enter state
func enter_state():
	animated_sprite_2d.play("idle")
	
# 2. update, do stuff
func update(delta : float):
	var direction = InputManager.get_direction()
	if (direction):
		transition.emit("Run")
		
	if (InputManager.get_input_jump()):
		transition.emit("Jump")
	
# 3. exist state, transition
func exit_state():
	animated_sprite_2d.stop()
