extends CharacterBody2D

@export var speed := 200

func _physics_process(delta):
    var input_vector = Vector2.ZERO
    input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    if input_vector.length() > 0:
        input_vector = input_vector.normalized() * speed
    velocity = input_vector
    move_and_slide()
