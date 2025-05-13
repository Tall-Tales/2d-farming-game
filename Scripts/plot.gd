class_name Plot
extends StaticBody2D

@export var sprite: Sprite2D
@export var crop: Crop

func _ready():
	%WorldClock.clock_progress.connect(handle_hourly_growth)
	sprite.texture = crop.texture

func handle_hourly_growth(day, hour):	
	if hour % 12 == 0:
		crop.advance_growth_phase()
		
	sprite.texture = crop.texture

func _mouse_shape_enter(shape_idx: int):
	if crop.is_harvestable():
		Input.set_custom_mouse_cursor(Global.RESOURCES.CURSOR.HARVEST)
	
func _mouse_shape_exit(shape_idx: int):
	Input.set_custom_mouse_cursor(Global.RESOURCES.CURSOR.DEFAULT)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int):
	if Focus.event_is_action_pressed(event, &"select"):
		if crop.is_harvestable():
			harvest()
			Input.set_custom_mouse_cursor(Global.RESOURCES.CURSOR.DEFAULT)

func harvest():
	if crop.is_harvestable():
		var loot = Global.RESOURCES.NODE.LOOTABLE_ITEM.instantiate()
		loot.item = crop.harvest
		loot.position = position
		get_parent().add_child(loot)
		queue_free()
	
