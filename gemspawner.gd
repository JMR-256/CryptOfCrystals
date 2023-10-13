extends Node3D
@export var num_of_gems:int = 0
@export var gems:Array[PackedScene] = []
@export var locations:Array[Vector3] = []

signal gem_collected()

func _ready():
	create_gems_at_locations()

func create_gems_at_locations():
	print(num_of_gems)
	print(locations)
	for i in num_of_gems:
		var locationIndex = randi_range(0, locations.size()-1)
		spawn_gem(locations[locationIndex])
		locations.pop_at(locationIndex)

func spawn_gem(location:Vector3):
	var gem_scene = gems.pick_random()
	var new_gem = gem_scene.instantiate()

	new_gem.collected.connect(on_gem_collected)
	add_child(new_gem)
	new_gem.global_transform.origin = location


func on_gem_collected():
	gem_collected.emit()
