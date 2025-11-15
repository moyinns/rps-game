extends CanvasLayer

signal on_transition_finished

@onready var transition_colour: ColorRect = $"transition colour"
@onready var transition_animation: AnimationPlayer = $"transition animation"
@onready var rps_help: TextureRect = $"rps help"

func _ready() -> void:
	transition_colour.visible = false
	rps_help.visible = false
	transition_animation.animation_finished.connect(_on_animation_finished)
	
func transition(): # plays the fade to black transition
	transition_colour.visible = true
	transition_animation.play("fade_to_black")

func transition_rps_fade_out(): # makes the rps help image fade out
	transition_animation.play("rps_help_fade_out") 	# in the future, ill use a tween, this was a tad bit messy ;(
	await transition_animation.animation_finished
	rps_help.visible = false
	
func transition_rps_help(): # makes the rps help image fade in
	rps_help.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rps_help.modulate.a = 0.0 
	rps_help.visible = true
	transition_animation.play("rps_help_fade_in")

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black": # checks if the fade to black animation has been played, and plays the fade to normal animation
		on_transition_finished.emit()
		transition_animation.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		transition_colour.visible = false
