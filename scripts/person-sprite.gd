extends Sprite2D

@export var textures = {
	'ok': load('res://assets/person 1.png'),
	'stunned': load('res://assets/person lying 1.png')
}

func _ready():
	texture = textures['ok']

# set_texture is already a real thing on Sprite
func new_texture(new_texture):
	texture = new_texture
