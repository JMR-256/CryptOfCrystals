extends Node3D

signal score_updated()
@onready var winningPoints = $gemspawner.num_of_gems
var points:int = 0

func _unhandled_input(_event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_gemspawner_gem_collected():
	points += 1
	print("Collected gem. Total gems: ", points)
	if(points == winningPoints):
		print("Win condition")
	score_updated.emit(points)
