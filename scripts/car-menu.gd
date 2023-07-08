extends CharacterBody2D

const DECELERATION = 0.5
const DELAY_BETWEEN_WHIPS = 2
var topDelay = 2
var bottomeDelay = 2.3

var motion = Vector2()
func _ready():
	var victoryHorn = get_tree()

func calculate_movement(delta) -> Vector2:
	var people_movement = Vector2()
	if topDelay == 0:
		people_movement += $personTop.process()
		topDelay += DELAY_BETWEEN_WHIPS + randf()
	else:
		topDelay -= delta
		if topDelay < 0:
			topDelay = 0
			
	if bottomeDelay == 0:
		people_movement +=  $personBottom.process()
		bottomeDelay += DELAY_BETWEEN_WHIPS + randf()
	else:
		bottomeDelay -= delta
		if bottomeDelay < 0:
			bottomeDelay = 0

	rotation += people_movement.y / 25
	motion += people_movement.rotated(rotation)
	
	var deceleration = -motion.normalized() * DECELERATION
	if VectorUtils.are_vectors_in_opposite_directions(motion + deceleration, motion):
		motion = Vector2()
	else:
		motion += deceleration
		
	return motion

func _physics_process(delta):
	motion = calculate_movement(delta)
	var collision_target: KinematicCollision2D = move_and_collide(motion)
	
	if collision_target:
		if !$ouch.is_playing():
			$ouch.play()
