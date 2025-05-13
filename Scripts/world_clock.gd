class_name WorldClock
extends Timer

@export_group("Clock", "clock_")
@export_range(1, 200, 10, "suffix:sec") var clock_hour_length := 200 #seconds
@export_range(1, 100, 1) var clock_time_scale := 1

var hour := 0
var day := 0

# update our GUI
signal clock_progress
# trigger timing events
signal new_day

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start(clock_hour_length / clock_time_scale)
	timeout.connect(handle_hour_end)

func handle_hour_end():
	hour += 1
	
	if hour == 24:
		day += 1
		hour = 0
		new_day.emit()
	
	clock_progress.emit(day,hour)
