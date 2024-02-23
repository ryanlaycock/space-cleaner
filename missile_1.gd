extends RigidBody2D

var missile_speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	var direction = Vector2(1, 0).rotated(get_rotation())

	# Add velocity in the direction the object is facing
	var velocity = direction * missile_speed

	apply_central_impulse(velocity)
	#set_linear_velocity(velocity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
