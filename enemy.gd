extends CharacterBody3D

@export var SPEED = 3
var ORIGINAL_SPEED = SPEED
@onready var player = get_parent().get_node("Player")

func _physics_process(_delta):
	if not player:
		return
	
	var motion = Vector3.ZERO
	motion += position.direction_to(player.position)
	var distance = position.distance_to(player.position)
	
	if(distance > 15):
		SPEED = ORIGINAL_SPEED + 5
		motion += position.direction_to(Vector3(RandomNumberGenerator.new().randf_range(-10,10),position.y,RandomNumberGenerator.new().randf_range(-10,10)))
	else:
		SPEED = ORIGINAL_SPEED
		
	print("distance: ", distance)
	velocity = motion * SPEED
	move_and_slide()
