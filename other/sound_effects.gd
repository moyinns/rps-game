extends Control

@onready var button = $button
@onready var typing: AudioStreamPlayer = $typing


func play_button_sound(): # this plays the button sound effect
	button.play()
	
func play_typing_sound(): # this plays the typing sound effect
	typing.play()
	
func stop_typing_sound(): # this stops the typing sound effects
	typing.stop()
