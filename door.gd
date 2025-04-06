extends StaticBody2D

var isOpen := false
@onready var sprite = $AnimatedSprite2D
@onready var collider = $CollisionShape2D

func open():
	if collider.shape is SegmentShape2D:
		collider.shape.b = Vector2(-6,0)
	sprite.play()
	isOpen = true
	
func close():
	if collider.shape is SegmentShape2D:
		collider.shape.b = Vector2(6,0)
	sprite.play_backwards()
	isOpen = false

func _input(event):
	if Input.is_action_pressed("interact"):
		if isOpen:
			close()
		else:
			open()
