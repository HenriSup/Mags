class_name Feve
extends AnimatedSprite2D

@export var explosion:AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _playAnimation():
	play("default")

func _playKill():
	play("default")
	#TODO add hurting to life bar and tell the enemysprite to be hurt
	pass


func _delete():
	queue_free()
	
func _on_timer_timeout():
	#$AnimationPlayer.play("explode")
	pass # Replace with function body.
