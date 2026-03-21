class_name Player
extends CharacterBody2D

@export var player_bullet: PackedScene
@export var shooting_sprite: AnimatedSprite2D
@export var can_move = false
@export var should_go_center = false
@export var is_falling = false
const SPEED = 600.0

func _physics_process(_delta):
		
	if can_move:
		var direction = Input.get_vector("left","right","up","down")
		velocity= direction * SPEED
		move_and_slide()
		
	var wantsToShoot = false
	if Input.is_action_pressed("shoot"):
		wantsToShoot = true
	if can_move and wantsToShoot and $CanShootTimer.is_stopped() :
		var newPlayerBullet = player_bullet.instantiate()
		newPlayerBullet.global_position=$Offset/SpriteHolder/ShakeContainer/Marker2D.global_position
		get_tree().root.add_child(newPlayerBullet)
		$CanShootTimer.start()
		shooting_sprite.frame=0
		shooting_sprite.play("default")
		$ShootSound.play()
	if should_go_center:
		var direction_center = global_position.direction_to(Vector2(0,0))
		velocity= direction_center * SPEED/3
		move_and_slide()
		if ((global_position.x > -5) and (global_position.x <5 )):
			if ((global_position.y > -5) and (global_position.y < 5)):
				should_go_center=false


func _allow_movement():
	can_move=true
	
func _disable_movement():
	can_move=false

func _activate_move_center():
	should_go_center = true
	
func _disable_move_center():
	should_go_center = false

func _takeHit():
	print("ouillle")
	$Offset/SpriteHolder/ShakeContainer/AnimationPlayer2.play("hurt")
	pass
