extends Camera2D

var player: Node
var camera_offset: Vector2 = Vector2(100, 0)

func _ready():
	player = get_tree().get_first_node_in_group('player')

func _process(_delta):
	var pt = player.get_transform()
	transform = Transform2D(pt.x + camera_offset, pt.y, camera_offset)
