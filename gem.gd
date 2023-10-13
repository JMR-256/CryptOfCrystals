extends Area3D

signal collected()

func _on_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
		collected.emit()

