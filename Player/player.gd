extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 11
const SENSITIVITY = 0.003
const SPRINT_MULTIPLIER = 1.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var head = $head
@onready var camera = $head/cam
@onready var gemsound = $gemsound

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):

	if event is InputEventMouseMotion:

		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta):

	velocity.y -= gravity * delta * 3

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY	

	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if(Input.is_action_pressed("sprint")):
			velocity.x = direction.x * SPEED * SPRINT_MULTIPLIER
			velocity.z = direction.z * SPEED * SPRINT_MULTIPLIER
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	move_and_slide()


func _on_gemspawner_gem_collected():
	gemsound.play()
