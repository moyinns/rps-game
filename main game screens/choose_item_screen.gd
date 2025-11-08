extends Node2D

@onready var chosen_label_animation: AnimationPlayer = $"chosen label animation"
@onready var title_button_cover: ColorRect = $"title button cover"
@onready var chosen_label: Label = $"chosen label"
@onready var back_to_home_button_cover: ColorRect = $"back to home button cover"
@onready var back_to_home_button: Button = $"back to home button"
@onready var rock_control: Control = $"rock control"
@onready var paper_control: Control = $"paper control"
@onready var scissors_control: Control = $"scissors control"
@onready var rock: TextureRect = $"rock control/rock"
@onready var paper: TextureRect = $"paper control/paper"
@onready var scissors: TextureRect = $"scissors control/scissors"
@onready var rock_desc: Label = $"rock control/rock desc"
@onready var paper_desc: Label = $"paper control/paper desc"
@onready var scissors_desc: Label = $"scissors control/scissors desc"
@onready var rock_button: Button = $"rock control/rock button"
@onready var paper_button: Button = $"paper control/paper button"
@onready var scissors_button: Button = $"scissors control/scissors button"
@onready var rock_animation: AnimationPlayer = $"rock control/rock animation"
@onready var paper_animation: AnimationPlayer = $"paper control/paper animation"
@onready var scissors_animation: AnimationPlayer = $"scissors control/scissors animation"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rock_control.mouse_filter = Control.MOUSE_FILTER_IGNORE
	paper_control.mouse_filter = Control.MOUSE_FILTER_IGNORE
	scissors_control.mouse_filter = Control.MOUSE_FILTER_IGNORE
	back_to_home_button_cover.modulate.a = 0
	title_button_cover.modulate.a = 0
	back_to_home_button_cover.visible = true
	title_button_cover.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rock_button_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.player1_choice = "rock"
	rock_animation.play("rock_to_middle")
	paper_animation.play("paper_fade_out")
	scissors_animation.play("scissors_fade_out")
	await rock_animation.animation_finished
	rock_animation.play("rock_button_fade_out")
	var tween = create_tween()
	tween.tween_property(title_button_cover, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(back_to_home_button_cover, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(back_to_home_button, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.finished
	chosen_label.visible = false
	chosen_label.text = "you chose "+str(Globals.player1_choice)+"!"
	typing_chosen_label()
	await chosen_label_animation.animation_finished
	await get_tree().create_timer(1.0).timeout
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	if Globals.player_type == "ai":
		get_tree().change_scene_to_file("res://main game screens/ai_choose_item_screen.tscn")

func typing_chosen_label():
	chosen_label_animation.play("typing_chosen")
	chosen_label.visible = true
	SoundEffects.play_typing_sound()
	#chosen_label_animation.connect("animation_finished", self._on_animation_finished)
	await chosen_label_animation.animation_finished
	SoundEffects.stop_typing_sound()

#func _on_animation_finished(anim_name):
	#if anim_name == "typing_chosen":
		#SoundEffects.stop_typing_sound()
	
	
func _on_paper_button_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.player1_choice = "paper"
	rock_animation.play("rock_fade_out")
	scissors_animation.play("scissors_fade_out")
	await rock_animation.animation_finished
	paper_animation.play("paper_button_fade_out")
	var tween = create_tween()
	tween.tween_property(title_button_cover, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(back_to_home_button_cover, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(back_to_home_button, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.finished
	chosen_label.visible = false
	chosen_label.text = "you chose "+str(Globals.player1_choice)+"!"
	typing_chosen_label()
	await chosen_label_animation.animation_finished
	await get_tree().create_timer(1.0).timeout
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	if Globals.player_type == "ai":
		get_tree().change_scene_to_file("res://main game screens/ai_choose_item_screen.tscn")
	
func _on_scissors_button_pressed() -> void:
	SoundEffects.play_button_sound()
	Globals.player1_choice = "scissors"
	scissors_animation.play("scissors_to_middle")
	rock_animation.play("rock_fade_out")
	paper_animation.play("paper_fade_out")
	await scissors_animation.animation_finished
	scissors_animation.play("scissors_button_fade_out")
	var tween = create_tween()
	tween.tween_property(title_button_cover, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(back_to_home_button_cover, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(back_to_home_button, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.finished
	chosen_label.visible = false
	chosen_label.text = "you chose "+str(Globals.player1_choice)+"!"
	typing_chosen_label()
	await chosen_label_animation.animation_finished
	await get_tree().create_timer(1.0).timeout
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	if Globals.player_type == "ai":
		get_tree().change_scene_to_file("res://main game screens/ai_choose_item_screen.tscn")

func _on_back_to_home_button_pressed() -> void:
	SoundEffects.play_button_sound()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")
