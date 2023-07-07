extends CharacterBody2D
var Person = load('res://scripts/person.gd')

const DECELERATION = 0.5

var people: Array = []
var motion = Vector2()

func _ready():
	people.append_array([
		Person.new(1, 2, "Row 1 Person 1"), # changed to col=2 for a more fun angle
		Person.new(2, 2, "Row 2 Person 1")  # TODO: change the angle calculation in Person
	])

func calculate_movement() -> Vector2:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var poeple_movement = people.reduce(func(acc, current): return acc + current.process(), Vector2())
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
