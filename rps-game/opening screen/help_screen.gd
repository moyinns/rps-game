extends Node2D
@onready var help_text_animation: AnimationPlayer = $"help text animation"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	help_text_animation.play("typing_help_text")
	SoundEffects.play_typing_sound()
	help_text_animation.connect("animation_finished", self._on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "typing_help_text":
		SoundEffects.stop_typing_sound()
		TransitionScreen.transition_rps_help()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_to_home_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")
