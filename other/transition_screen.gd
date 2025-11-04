extends CanvasLayer

signal on_transition_finished

@onready var transition_colour: ColorRect = $"transition colour"
@onready var transition_animation: AnimationPlayer = $"transition animation"

func _ready() -> void:
	transition_colour.visible = false
	transition_animation.animation_finished.connect(_on_animation_finished)
	
func transition():
	transition_colour.visible = true
	transition_animation.play("fade_to_black")

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		transition_animation.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		transition_colour.visible = false
