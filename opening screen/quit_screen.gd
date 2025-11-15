extends Node2D
@onready var quit_timer = $"quit timer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quit_timer.start()



func _on_quit_timer_timeout() -> void: # this quits the game after 1.5 secs
	get_tree().quit()
