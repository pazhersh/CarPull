extends Camera2D
#
var current_player_angle: float
var target: Node = null
#func _ready():
#	if target:
#		position = target.position
#
func _process(_delta):
	if not target:
		return

	var angle: float = rad_to_deg(target.transform.get_rotation())
	if current_player_angle != angle:
		current_player_angle = angle
		transform = Transform2D(deg_to_rad(calculate_quadrant(angle) - angle), transform.get_origin())
		print_debug(target.transform)
		print_debug(transform)

func calculate_quadrant(angle: float):
	if angle < 0:
		angle = 360 + angle
	if angle < 45 or angle > 315:
		return 0

	if angle > 45 and angle < 135:
		return 90

	if angle > 135 and angle < 225:
		return 180

	return -90
