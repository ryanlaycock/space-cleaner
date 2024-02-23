extends Node2D

@export var missile_scene: PackedScene
var missile_speed = 5000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("gun_1"):
		spawn_missile()
		
func spawn_missile():
	var missile = missile_scene.instantiate()

	var missile_spawn_location = $MissileSpawnPoint

	missile.rotation = -get_rotation()
	missile.position = missile_spawn_location.position
	
	add_child(missile)

	var direction = Vector2(1, 0).rotated(missile.rotation)

	# Add velocity in the direction the object is facing
	var velocity = direction * missile_speed

	missile.set_linear_velocity(velocity)
