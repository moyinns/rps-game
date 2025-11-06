extends Node2D

@onready var rock_button: TextureButton = $"rock button"
@onready var rock_image: TextureRect = $"rock image"
@onready var rock_animation: AnimationPlayer = $"rock animation"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_rock_button_pressed() -> void:
	Globals.player1_choice = "rock"
	print("button presssed")
	


func _on_back_to_home_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")
