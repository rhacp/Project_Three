@tool
class_name Transition
extends Area2D

@export_enum("level_one", "level_two") var level = "level_one"

var levels : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	if (!Engine.is_editor_hint()):
		levels["level_one"] = "res://level/level_one.tscn"
		levels["level_two"] = "res://level/level_two.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered(body):
	if (body.is_in_group("Player")):
		if (!body.has_key()):
			TransitionManager.change_scene(levels[level])

func _on_access_transition_body_entered(body):
	if (body.is_in_group("Player")):
		if (body.has_key()):
			print("You've got the key!")
			level = "level_two"
			TransitionManager.change_scene(levels[level])
		else:
			print("No key! You shall not pass!")
