extends CharacterBody2D
var Person = load('res://scripts/person.gd')

const PULL_POWER = 1000.0
const MAX_ROW = 2
const MAX_COLUMN = 1

var people: Array = []

func _ready():
	people.append_array([
		Person.new(1, 1, "Row 1 Person 1"),
		Person.new(2, 1, "Row 2 Person 1")
	])

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var poeple_movement = people.reduce(func(acc, current): return acc + current.process(), Vector2())
	rotation += poeple_movement.y / 2
	velocity = poeple_movement.rotated(rotation) * PULL_POWER
	
	move_and_slide()
