extends Node2D

@onready var successful_save_label: Label = $"successful save label"


func _ready() -> void:
	successful_save_label.visible = false

func _process(_delta: float) -> void:
	pass

func _on_back_to_home_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")

func _on_ai_button_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.player_type = "ai"

func _on_two_player_button_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.player_type = "two player"

func _on_best_of_one_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.no_of_rounds = 1

func _on_best_of_three_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.no_of_rounds = 3

func _on_best_of_five_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.no_of_rounds = 5

func _on_best_of_seven_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.no_of_rounds = 7

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value))

func _on_save_button_pressed() -> void:
	SoundEffects.play_button_sound()
	var file = FileAccess.open(Globals.save_path, FileAccess.WRITE)
	file.store_var(Globals.wins)
	file.store_var(Globals.player_type)
	file.store_var(Globals.no_of_rounds)
	file.close()
	successful_save_label.visible = true
	await get_tree().create_timer(2).timeout
	successful_save_label.visible = false
