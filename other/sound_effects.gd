extends Control

@onready var button = $button
@onready var typing: AudioStreamPlayer = $typing


func play_button_sound():
	button.play()
	
func play_typing_sound():
	typing.play()
	
func stop_typing_sound():
	typing.stop()
