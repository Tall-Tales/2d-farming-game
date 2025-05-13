extends StaticBody2D

var is_open := false
@onready var sprite = $AnimatedSprite2D
@onready var collider = $CollisionShape2D

func open():
	if collider.shape is SegmentShape2D:
		collider.shape.b = Vector2(-6,0)
	sprite.play()
	is_open = true
	
func close():
	if collider.shape is SegmentShape2D:
		collider.shape.b = Vector2(6,0)
	sprite.play_backwards()
	is_open = false

func _input(event):
	if Focus.input_is_action_pressed("interact"):
		if is_open:
			close()
		else:
			open()
