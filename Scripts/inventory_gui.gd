extends GridContainer

@export var player: Player
@export var item_slots := []

func _ready():
	player.inventory.item_added.connect(handle_item_added, CONNECT_DEFERRED)
	
	for i in range(0, player.inventory.max_capacity):
		var item_slot: ItemSlot = Global.RESOURCES.NODE.ITEM_SLOT.instantiate()
		item_slot.item = player.inventory.items[i]
		item_slot.item_position = "%d" % [i + 1]
		item_slots.append(item_slot)
		add_child(item_slot)

func find_first_empty(item_slot: ItemSlot):
	return item_slot.item == null

func handle_item_added(item):
	# find first available empty slot
	var item_index = item_slots.find_custom(find_first_empty)
	assert(item_index >= 0)
	
	if item_index >= 0:
		item_slots[item_index].item = item
