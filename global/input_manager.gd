extends Node

# get direction input
static func get_direction() -> float:
	var dir : float = Input.get_axis("move_left", "move_right")
	return dir

static func get_input_jump() -> bool:
	return Input.is_action_just_pressed("jump")

static func get_input_damage() -> bool:
	return Input.is_action_just_pressed("damage")
