extends Node2D
@onready var success_load_screen: TextureRect = $"success load screen"
@onready var unsuccess_load_screen: TextureRect = $"unsuccess load screen"
@onready var save_found_button: Button = $"save found button"
@onready var no_save_found_button: Button = $"no save found button"


func _ready() -> void:
	load_data()

func _process(delta: float) -> void:
	pass

func load_data(): # changes the scene depending on whether a save file was found
	if FileAccess.file_exists(Globals.save_path):
		unsuccess_load_screen.visible = false
		no_save_found_button.visible = false
	else:
		success_load_screen.visible = false
		save_found_button.visible = false


func _on_back_to_home_button_pressed() -> void: # takes u back to opening screen
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")

func _on_save_found_button_pressed() -> void: # opens the file + loads the new data
	SoundEffects.play_button_sound()
	var file = FileAccess.open(Globals.save_path, FileAccess.READ)
	Globals.wins = file.get_var()
	Globals.player_type = file.get_var()
	Globals.no_of_rounds = file.get_var()
	file.close()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")
	
func _on_no_save_found_button_pressed() -> void: # takes you back to homescreen
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")
