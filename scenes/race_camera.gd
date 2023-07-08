extends Camera2D

@onready var p1_location = Vector2()
@onready var p2_location = Vector2()

func _process(delta):
	position = Vector2.(p1_location, p2_location)

func _on_carp_1_car_moved(car_position):
	p1_location = car_position


func _on_carp_2_car_moved(car_position):
	p2_location = car_position
