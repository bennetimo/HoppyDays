extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1500
const GRAVITY = 300
const UP = Vector2(0, -1)
const JUMP_SPEED = 4000
const WORLD_LIMIT = 3000
const BOOST_MULTIPLIER = 2

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	motion = move_and_slide(motion, UP)
	
func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "end_game")
	
	if is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
#	else: motion.y = 0
	
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()
		
func move():
	if Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and !Input.is_action_pressed("left"):
		motion.x = SPEED
	else: motion.x = 0

func animate():
	emit_signal("animate", motion)
	
func hurt():
	motion.y -= JUMP_SPEED	
	$PainSFX.play()
#	if lives < 0:
#		end_game()
		
func boost():
	motion.y = -JUMP_SPEED * BOOST_MULTIPLIER