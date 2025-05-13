extends Area2D

@export var player: Player
@export var attraction_range: CollisionShape2D
@export var pickup_range: CollisionShape2D

func _init():
	connect(&'body_shape_entered', handle_body_shape_entered)

func handle_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int):
	print('body_shape_entered\n[%s]' % body.name)
	if body is LootableItem:
		if local_shape_index == attraction_range.get_index():
			body.stop_animations()
		if local_shape_index == pickup_range.get_index():
			player.inventory.add_item(body.item)
			body.queue_free()
