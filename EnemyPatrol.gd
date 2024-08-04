class_name EnemyPatrolState
extends State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"
@onready var idle_timer = $"../../Timer/IdleTimer"

@export_group("Enemy")
@export var enemy : CharacterBody2D = null
@export var patrol_limit_x = 200

var distance_traveled

# 1. enter state
func enter_state():
	var duration = enemy.rng.randi_range(3, 6)
	animated_sprite_2d.play("chase")
	idle_timer.start(duration)
	
# 2. update, do stuff
func update(delta : float):
	distance_traveled = abs(enemy.initial_pos.x - enemy.position.x)
	check_limits()
	
	enemy.velocity.x = enemy.SPEED * delta * enemy.direction
	check_margins()
	
	# transition to idle	
	if (!idle_timer.time_left):
		transition.emit("EnemyIdle")
	
# 3. exist state, transition
func exit_state():
	animated_sprite_2d.stop()
	
# Helper Functions
func check_limits():
	if (distance_traveled  > patrol_limit_x):
		if (enemy.direction == 1):
			enemy.direction = -1
		else:
			enemy.direction = 1
			
func check_margins():
	if (enemy.right_ray_cast.is_colliding()):
		enemy.direction = -1
			
	if (enemy.left_ray_cast.is_colliding()):
		enemy.direction = 1
