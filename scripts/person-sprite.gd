extends Sprite2D

@export var textures = {
	'ok': 'res://assets/person 1.png',
	'stunned': 'res://assets/person lying 1.png',
	'invincible': 'res://assets/person green 1.png'
}

func _ready():
	texture = load(textures['ok'])

# set_texture is already a real thing on Sprite
func new_texture(new_texture):
	texture = load(new_texture)
