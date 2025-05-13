class_name LootableItem
extends RigidBody2D

@export var item: Item
@export var sprite: Sprite2D
var tween: Tween

func _ready():
	sprite.texture = item.texture
	tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	
	var duration = 0.5
	tween.tween_property(self, "position:y", position.y + 2, duration)
	tween.tween_property(self, "position:y", position.y - 2, duration)
	tween.set_loops()

func stop_animations():
	tween.kill()
