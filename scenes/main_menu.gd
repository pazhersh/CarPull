extends Control

@export var tutorial_scene: PackedScene;
@export var racePvp_scene: PackedScene;
func _on_tutorial_button_up():
	get_tree().change_scene_to_file(tutorial_scene.resource_path)

func _on_race_pvp_button_up():
	get_tree().change_scene_to_file(racePvp_scene.resource_path)
