extends Label

func _on_world_score_updated(points):
	text = "Gems: " + str(points)
	await get_tree().create_timer(3.0).timeout
	text = ""
