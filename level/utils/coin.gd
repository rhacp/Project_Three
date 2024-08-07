class_name Coin
extends Area2D

### manages the pickable coin for passing tot he next level
func _on_body_entered(body):
	if (body.is_in_group("Player")):
		body.pick_up_coin("You obtained points!")
		queue_free()
