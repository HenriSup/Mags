extends CharacterBody2D

var can_move = false
const SPEED = 600.0

func _physics_process(delta):
	
	var direction = Input.get_vector("left","right","up","down")
	velocity= direction * SPEED
	if can_move:
		move_and_slide()

func _allow_movement():
	can_move=true
	
func _disable_movement():
	can_move=false
