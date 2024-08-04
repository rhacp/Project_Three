class_name StateMachine
extends Node

@export var current_state : State = null

var current_state_name : String
var states : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(on_transition)
			
	current_state.enter_state()
	current_state_name = current_state.name

func _physics_process(delta):
	if (current_state):
		current_state.update(delta)

func on_transition(target_state_name : String):
	var new_state = states.get(target_state_name.to_lower())
	
	current_state.exit_state()
	new_state.enter_state()
	
	current_state = new_state
	current_state_name = new_state.name.to_lower()
