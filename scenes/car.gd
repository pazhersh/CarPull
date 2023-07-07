extends CharacterBody2D
var Person = load('res://scenes/person.gd')

const PULL_POWER = 300.0
const MAX_ROW = 2
const MAX_COLUMN = 1

func _physics_process(delta):
	var person1 = Person.new(1, 1, "Row 1 Person 1")
	var person2 = Person.new(2, 1, "Row 2 Person 1")
	var people = [person1, person2]
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var poeple_movement = people.reduce(func(acc, current): return acc + current.process(), Vector2())
	velocity = poeple_movement * PULL_POWER
	
	move_and_slide()
