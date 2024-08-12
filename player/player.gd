class_name Player
extends CharacterBody2D

@onready var health_bar = $HealthBar
@onready var label = $Label

const gravity = 980.0
const JUMP_VELOCITY = -250.0
const SPEED = 300.0

@export_group("Points")
@export var points_value : int = 0

@export_group("Health")
@export var health_max_value : int = 20
@export var health_initial_value : int = 15

@export_group("Jump")
@export var jump_counter = 0;
@export var jump_limit = 2;

var key : bool = false
var death_check : bool
var bounce_player : bool = false
var ignore_input : bool = false
# var current_health

func _ready():
	health_ready()
	points_ready()
	
func points_ready():
	label.text = str(points_value)

# ready the health bar
func health_ready():
	health_bar.max_value = health_max_value
	health_bar.value = health_initial_value
	death_check = false

# add gravity to player
func _physics_process(delta):
	if (!is_on_floor()):
		velocity.y += gravity * delta
		
	move_and_slide()
	
	if (is_on_floor()):
		ignore_input = false
		velocity.x = 0
	
	death()
	#print(ignore_input)
	
func pick_up_coin(message : String) -> void:
	points_value += 1
	label.text = str(points_value)
	print(message)
	
# check if the player has the key
func has_key():
	return key
	
# add key to player when pick up
func pick_up(message : String):
	key = true
	print(message)
	
# manage the player damage to his health
func damage() -> void:
	#if (InputManager.get_input_damage()):
		health_bar.value -= 1
	
# manage player death
func death() -> void:
	if (health_bar.value == 0):
		death_check = true
	
# reset the health after death
func reset_health() -> void:
	health_ready()
	
# bounce on enemy collision
func bounce() -> void:
	if (bounce_player == true):
		velocity.y = -250
		velocity.x = -300
		bounce_player = false
	
# colission with enemy
func _on_player_area_area_entered(area):
	if (area.is_in_group("EnemyArea")):
		ignore_input = true
		bounce_player = true
		damage()
		bounce()
