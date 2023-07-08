extends Camera2D
#
var camera_offset: Vector2 = Vector2(100, 0)
var current_player_angle: float
var target: Node = null

func _process(_delta):
	if target:
		position = target.position
