extends RigidBody2D

var speed = 10
var damping = 3
var torque = 400.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("forward"):
		apply_forward()
	else:
		stop_forward(delta)
		
	if Input.is_action_pressed("left"):
		apply_torque(-torque * delta)
	if Input.is_action_pressed("right"):
		apply_torque(torque * delta)

func apply_forward():
	var rotation = get_rotation()

	# Convert rotation to a direction vector
	var direction = Vector2(0, -1).rotated(rotation)

	# Add velocity in the direction the object is facing
	var velocity = direction * speed
	apply_central_impulse(velocity)
	
func stop_forward(delta):
	linear_velocity -= linear_velocity * damping * delta
