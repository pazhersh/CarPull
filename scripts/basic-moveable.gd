extends CharacterBody2D

var direction: Vector2;


func read_input():
	velocity = Vector2();
	
	if Input.is_action_pressed("up"):
		velocity.y -=1
		
	if Input.is_action_pressed("down"):
		velocity.y +=1
		
	if Input.is_action_pressed("left"):
		velocity.x -=1
		
	if Input.is_action_pressed("right"):
		velocity.x +=1
		
	velocity = velocity.normalized();
	
	velocity *= 200;
	
	move_and_slide();

func _physics_process(delta):
	read_input();
