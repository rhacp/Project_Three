class_name Enemy
extends CharacterBody2D

@onready var idle_timer = $"../../Timer/IdleTimer"
@onready var right_ray_cast = $RightRayCast
@onready var left_ray_cast = $LeftRayCast
@onready var label = $Label

var initial_pos : Vector2
var direction : int = 1
var rng = RandomNumberGenerator.new()

const gravity = 700
const SPEED = 2000

func _ready():
	initial_pos = global_position
	label.text = "My gem is here!"

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
	
func obj_detection(is_item_present : bool):
	if (is_item_present):
		print("I see my gem!")
		label.text = "My gem is here!"
	else:
		label.text = "I will kill you!"
