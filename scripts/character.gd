extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D

const SPEED = 200.0
var direction = Vector2(0,0) 

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("move_left", "move_right")
	var directionY = Input.get_axis("move_top", "move_down")
	

	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _process(_delta):
	

	if Input.is_action_pressed("move_right"):
		_animated_sprite.play("walking_right")
	else:
		if Input.is_action_pressed("move_left"):
			_animated_sprite.play("walking_left")
		else:
			if Input.is_action_pressed("move_top"):
				_animated_sprite.play("walking_up")
			else:
				if Input.is_action_pressed("move_down"):
					_animated_sprite.play("walking_down")
				else:
					_animated_sprite.stop()
		
		
