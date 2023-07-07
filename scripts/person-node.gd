extends Node

const MAX_ROW = 2
const MAX_COLUMN = 1
const PULL_POWER = 5.0


func process():
	if Input.is_action_just_pressed(get_meta('Input')):
		return self.position.normalized() * PULL_POWER
	return Vector2()
