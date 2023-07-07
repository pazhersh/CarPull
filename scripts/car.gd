extends CharacterBody2D
var Person = load('res://scripts/person.gd')

const DECELERATION = 0.5

var motion = Vector2()

func are_vectors_in_opposite_directions(vector1, vector2):
	return vector1.angle_to(vector2) > PI / 2 # is the angle over 90d in radians

func _physics_process(delta):
	var person1 = Person.new(1, 2, "Row 1 Person 1") # changed to col=2 for a more fun angle
	var person2 = Person.new(2, 2, "Row 2 Person 1") # TODO: change the angle calculation in Person
	var people = [person1, person2]
	
	var poeple_movement = people.reduce(func(acc, current): return acc + current.process(), Vector2())
	motion += poeple_movement
	
	var deceleration = -motion.normalized() * DECELERATION
	if are_vectors_in_opposite_directions(motion + deceleration, motion):
		motion = Vector2()
	else:
		motion += deceleration
	
	move_and_collide(motion)
