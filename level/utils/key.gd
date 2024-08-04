class_name Key
extends Area2D

### manages the pickable key for passing tot he next level
func _on_body_entered(body):
	if (body.is_in_group("Player")):
		body.pick_up("You obtained the key!")
		queue_free()
