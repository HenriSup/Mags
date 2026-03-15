extends AnimatedSprite2D

@export var explosion:AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _playAnimation():
	play("default")

func _playKill():
	explosion.play("default")

func _delete():
	queue_free()
	
func _on_timer_timeout():
	$AnimationPlayer.play("explode")
	pass # Replace with function body.
