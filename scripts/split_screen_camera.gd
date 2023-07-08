extends Camera2D
#
var camera_offset: Vector2 = Vector2(100, 0)
var current_player_angle: float
var target: Node = null

func _process(_delta):
	if target:
		var pt = target.get_transform()
		transform = Transform2D(pt.x + camera_offset, pt.y, camera_offset)
