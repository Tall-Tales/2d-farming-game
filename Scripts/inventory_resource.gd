@tool
class_name Inventory
extends Resource

@export var max_capacity := 10
@export var items := { }

signal item_added
signal item_removed

func _init():
	for i in range(0, max_capacity):
		items[i] = null

func add_item(item):
	assert(item is Item)
	
	if item is Item:
		items[items.find_key(null)] = item
		item_added.emit(item)
	
func remove_item(item):
	assert(item is Item)
	
	if item is Item:
		items[items.find_key(item)] = null
		item_removed.emit(item)
