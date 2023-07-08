extends Sprite2D

@export var ok_sprite: CompressedTexture2D = load('res://assets/person 1.png')
@export var stunned_sprite: CompressedTexture2D = load('res://assets/person lying 1.png')
@export var invincible_sprite: CompressedTexture2D = load('res://assets/person green 1.png')

@export var textures = {
	PersonState.OK: ok_sprite,
	PersonState.STUNNED: stunned_sprite,
	PersonState.INVINCIBLE: invincible_sprite
}

func _ready():
	texture = textures[PersonState.OK]

# set_texture is already a real thing on Sprite
func set_state(state: int):
	texture = textures[state]
