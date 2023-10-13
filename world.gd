extends Node3D

var points:int = 0

func _unhandled_input(_event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _on_gemspawner_gem_collected():
	points += 1
	print(points)
	
