extends Node

@onready var viewport1 = $viewports/container1/viewport1
@onready var viewport2 = $viewports/container2/viewport2
@onready var camera1 = $viewports/container1/viewport1/Camera1
@onready var camera2 = $viewports/container2/viewport2/Camera2
@onready var world = $viewports/container1/viewport1/World

func _ready():
	viewport2.world_2d = viewport1.world_2d
	camera1.target = world.get_node('car-p1')
	camera2.target = world.get_node('car-p2')
