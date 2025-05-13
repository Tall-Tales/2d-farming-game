extends Node

enum GrowthPhase {
	GERMINATING,
	BUDDING,
	FLOWERING,
	MATURE
}

const RESOURCES = {
	"CURSOR": {
		"DEFAULT": preload("res://Assets/Cursors/Vector/Outline/hand_point.svg"),
		"HARVEST": preload("res://Assets/Cursors/Vector/Outline/hand_open.svg"),
	},
	"NODE": {
		"LOOTABLE_ITEM": preload("res://Scenes/lootable_item.tscn"),
		"ITEM_SLOT": preload("res://Scenes/item_slot.tscn")
	}
}
