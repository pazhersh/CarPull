extends CharacterBody2D

const DECELERATION = 0.5

var motion = Vector2()

func calculate_movement() -> Vector2:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# var poeple_movement = people.reduce(func(acc, current): return acc + current.process(), Vector2())
	var poeple_movement = get_tree().get_nodes_in_group("people").reduce(func(acc, current): return acc + current.process(), Vector2())
	rotation += poeple_movement.y / 25
	motion += poeple_movement.rotated(rotation)
	
	var deceleration = -motion.normalized() * DECELERATION
	if VectorUtils.are_vectors_in_opposite_directions(motion + deceleration, motion):
		motion = Vector2()
	else:
		motion += deceleration
		
	return motion

func _physics_process(_delta):
	motion = calculate_movement()
	var collision_target: KinematicCollision2D = move_and_collide(motion)
	
	if collision_target:
		print_debug(collision_target.get_collider())
