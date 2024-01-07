extends CharacterBody2D


const SPEED = 400.0;
const JUMP_VELOCITY = -900.0;
var isLeft = false;
var jumps = 0;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity");

@onready var sprite = $Sprite2D

func _physics_process(delta):
	
	if abs(velocity.x)  >= 1:
		sprite.animation = "running";
	else:
		sprite.animation = "default";	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite.animation = "jumping";

	if  is_on_floor():
		jumps = 0;

	# Handle jump.
	if Input.is_action_just_pressed("jump") and ((jumps == 1 and not is_on_floor()) or (jumps == 0 and is_on_floor())):
		jumps += 1;
		velocity.y = JUMP_VELOCITY;

	var direction = ceil(Input.get_axis("left", "right"));
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)
	
	if velocity.x > 0:
		isLeft = false
	elif velocity.x < 0:
		isLeft = true
	sprite.flip_h = isLeft;

	move_and_slide()
