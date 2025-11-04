extends Node2D



func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass


func _on_back_to_home_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")
