extends Node2D

var time: float = 0
var is_done: bool = false

func _process(delta):
	if not is_done:
		time += delta
		
	if Input.is_action_just_pressed('quit'):
		navigate_to_menu()

func on_dialog_confirm():
	navigate_to_menu()

func _on_carp_1_car_passed_finish_line():
	is_done = true
	
	var dialog = AcceptDialog.new()
	dialog.dialog_text = 'You win, congratz! It took you ' + str(int(time)) + ' seconds'
	add_child(dialog)
	dialog.popup_centered()
	dialog.confirmed.connect(on_dialog_confirm)

func navigate_to_menu():
	get_tree().change_scene_to_file('res://scenes/main_menu.tscn')
	
