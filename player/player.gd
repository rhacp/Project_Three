class_name Player
extends CharacterBody2D

#@onready var state_machine = $StateMachine

const gravity = 980.0
const JUMP_VELOCITY = -300.0
const SPEED = 300.0

@export_group("Jump")
@export var jump_counter = 0;
@export var jump_limit = 2;

var key : bool = false

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
	
func has_key():
	return key
	
func pick_up(message : String):
	key = true
	print(message)
