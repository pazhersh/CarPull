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

var whipSprite: AnimatedSprite2D
var personSprite: Sprite2D
var state: State
var state_time: float

func get_input():
	return get_meta('Input')

func _ready():
	whipSprite = get_children().filter(func(child): return child.name == 'Whip').front()
	personSprite = get_children().filter(func(child): return child.name == 'Sprite').front()
	var state = State.OK
	var state_time: float = 0
	
func play_animation():
	match state:
		State.STUNNED:
			personSprite.new_texture(personSprite.textures['stunned'])
		State.INVINCIBLE:
			personSprite.new_texture(personSprite.textures['invincible'])
		_:
			personSprite.new_texture(personSprite.textures['ok'])
			

func process():
	if state != State.STUNNED:
		if !whipSprite.is_playing():
			whipSprite.play_once()
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
	if body.is_in_group("obstacles") && state == State.OK:
		state = State.STUNNED
		state_time = STUN_TIME
