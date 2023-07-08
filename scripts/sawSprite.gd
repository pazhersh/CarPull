extends Sprite2D

const ROTATION_SPEED = 10

func _process(delta):
	rotation += delta * ROTATION_SPEED
