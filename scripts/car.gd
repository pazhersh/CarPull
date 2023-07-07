extends CharacterBody2D

const DECELERATION = 0.5

var motion = Vector2()
var stun_time: float = 0
var immunity_time: float = 0

func calculate_movement() -> Vector2:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var people_movement = get_tree().get_nodes_in_group("people").reduce(func(acc, current): return acc + current.process(), Vector2())
	rotation += people_movement.y / 25
	motion += people_movement.rotated(rotation)
	
	var deceleration = -motion.normalized() * DECELERATION
	if VectorUtils.are_vectors_in_opposite_directions(motion + deceleration, motion):
		motion = Vector2()
	else:
		motion += deceleration
		
	return motion

func _physics_process(delta):
	if stun_time:
		stun_time -= delta
		if stun_time <= 0:
			stun_time = 0
			immunity_time = 5.0
	else:
		motion = calculate_movement()
		var collision_target: KinematicCollision2D = move_and_collide(motion)
	
		if immunity_time:
			immunity_time -= delta
			if immunity_time <= 0:
				immunity_time = 0
		elif collision_target:
			stun_time = 3.0
			
