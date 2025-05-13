extends Label

@onready var world_clock = %WorldClock
@export_multiline var template_string = "Day: %d\nHour: %d"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world_clock.clock_progress.connect(handle_clock_progress)

func handle_clock_progress(day, hour):
	text = template_string % [day, hour]
