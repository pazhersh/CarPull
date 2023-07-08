extends Node2D

@export var main_menu: PackedScene;

func _process(delta):
	if Input.is_action_just_pressed('quit'):
		get_tree().change_scene_to_file(main_menu.resource_path)
