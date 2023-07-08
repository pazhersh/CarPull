extends Sprite2D

@export var ok_sprite: CompressedTexture2D
@export var stunned_sprite: CompressedTexture2D
@export var invincible_sprite: CompressedTexture2D

@onready var textures = {
	PersonState.OK: ok_sprite,
	PersonState.STUNNED: stunned_sprite,
	PersonState.INVINCIBLE: invincible_sprite
}

func _ready():
	texture = textures[PersonState.OK]

# set_texture is already a real thing on Sprite
func set_state(state: int):
	texture = textures[state]
