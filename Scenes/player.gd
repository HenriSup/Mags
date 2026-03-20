class_name Player
extends CharacterBody2D

@export var player_bullet: PackedScene
@export var shooting_sprite: AnimatedSprite2D
@export var can_move = false
const SPEED = 600.0

func _physics_process(_delta):
	
	var direction = Input.get_vector("left","right","up","down")
	velocity= direction * SPEED
	if can_move:
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
		pass


func _allow_movement():
	can_move=true
	
func _disable_movement():
	can_move=false

func _takeHit():
	print("ouillle")
	$Offset/SpriteHolder/ShakeContainer/AnimationPlayer2.play("hurt")
	pass
