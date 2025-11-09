extends Node2D

@onready var win_count: Label = $"win count"


func _ready() -> void:
	win_count.text = "wins: "+str(Globals.wins)
	Globals.rounds_played = 0



func _process(_delta: float) -> void:
	win_count.text = "wins: "+str(Globals.wins)


func _on_play_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://main game screens/choose_item_screen.tscn")

func _on_settings_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/settings_screen.tscn")

func _on_load_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/load_screen.tscn")

func _on_help_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/help_screen.tscn")

func _on_quit_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/quit_screen.tscn")
