extends TileMapLayer

@onready var overlay: Sprite2D = $TileOverlay
@onready var dirt_layer := %Dirt

func _ready():
	$TileOverlay.visible = true
	
func _input(event):
	if event is InputEventMouseMotion:
		var snapped_position = snapped(get_global_mouse_position(), Vector2(overlay.texture.get_width(), overlay.texture.get_height()))
		
		overlay.set_deferred("position", get_global_mouse_position().snapped(overlay.texture.get_size()))

	if event is InputEventMouseButton and event.is_pressed():
		var coords = local_to_map(get_global_mouse_position().round().snapped(Vector2(16, 16)))
		var data = get_cell_tile_data(coords)
		
		if data != null:
			# place dirt tile
			dirt_layer.set_cells_terrain_connect([coords], 1, 1)
			pass
