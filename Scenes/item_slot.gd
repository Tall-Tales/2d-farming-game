class_name ItemSlot
extends NinePatchRect

@export var item: Item:
	get:
		return item
	set(value):
		if value == null:
			item = null
			return
		
		item = value
		item_button.texture_normal = item.texture
		
@export var item_button: TextureButton
@export var hotkey_label: Label
var item_position: String

signal item_selected

func _ready():
	hotkey_label.text = item_position
	item_button.connect("pressed", handle_item_pressed)
	
func handle_item_pressed():
	item_selected.emit(item)
