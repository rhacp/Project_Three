class_name EnemyIdleState
extends State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"
@onready var idle_timer = $"../../Timer/IdleTimer"

@export_group("Enemy")
@export var enemy : CharacterBody2D = null

# 1. enter state
func enter_state():
	animated_sprite_2d.play("idle")
	idle_timer.start(2)
	
# 2. update, do stuff
func update(delta : float):
	enemy.velocity.x = 0
	
	# transition to patrol
	if (!idle_timer.time_left):
		transition.emit("EnemyPatrol")
	
# 3. exist state, transition
func exit_state():
	animated_sprite_2d.stop()
