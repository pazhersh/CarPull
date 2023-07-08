extends AnimatedSprite2D

func _ready():
	visible = false

func play_once():
	visible = true
	play()

func _on_animation_finished():
	visible = false
