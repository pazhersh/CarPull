extends Node

const MAX_ROW = 2
const MAX_COLUMN = 1

var _row
var _col
var _input: StringName

func _init(row, col, input: StringName):
	_row = row
	_col = col
	_input = input

func process(	):
	if Input.is_action_just_pressed(_input):
		var x = 1
		var row_center = MAX_ROW / _row
		var y = _row - row_center
		return Vector2(x, y).normalized()
	return Vector2()
