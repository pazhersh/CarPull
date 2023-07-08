extends Node

const MAX_ROW = 2
const MAX_COLUMN = 1
const PULL_POWER = 5.0

const STUN_TIME = 3
const INVINCIBILITY_TIME = 5

enum State {
	OK,
	STUNNED,
	INVINCIBLE
}

var animation
var state: State
var state_time: float

func _ready():
	var animation = $AnimationPlayer
	var state = State.OK
	var state_time: float = 0
	
func play_animation():
	var sprite_index = get_children().find(func (child): child is Sprite2D && child.StringName == 'Sprite') - 1
	var sprite = get_child(sprite_index)
	match state:
		State.STUNNED:
			sprite.new_texture(sprite.textures['stunned'])
		_:
			sprite.new_texture(sprite.textures['ok'])
			

func process():
	if state != State.STUNNED:
		if Input.is_action_just_pressed(get_meta('Input')):
			return self.position.normalized() * PULL_POWER
	return Vector2()
	
func _process(delta):
	play_animation()
	state_time -= delta
	if state_time < 0:
		match state:
			State.STUNNED:
				state = State.INVINCIBLE
				state_time = INVINCIBILITY_TIME
			_:
				state = State.OK
				state_time = 0


func _on_area_2d_body_entered(body):
	if body.is_in_group("obstacles") && state != State.INVINCIBLE:
		state = State.STUNNED
		state_time = STUN_TIME
