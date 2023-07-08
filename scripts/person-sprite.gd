extends Sprite2D

const textures = {
	PersonState.OK: 'res://assets/person 1.png',
	PersonState.STUNNED: 'res://assets/person lying 1.png',
	PersonState.INVINCIBLE: 'res://assets/person green 1.png'
}

func _ready():
	texture = load(textures[PersonState.OK])

# set_texture is already a real thing on Sprite
func set_state(state: int):
	texture = load(textures[state])
