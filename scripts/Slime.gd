extends KinematicBody2D

var run_speed = 35
var jump_speed = -100
var gravity = 250

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('right')
	var left = Input.is_action_pressed('left')
	var jump = Input.is_action_just_pressed('jump')

	if is_on_floor():
		$AnimatedSprite.play("Idle")
		$jump_sound.stop()
	if not is_on_floor():
		$AnimatedSprite.play("Jump")
	if is_on_floor() and jump:
		$jump_sound.play()
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
