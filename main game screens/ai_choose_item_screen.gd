extends Node2D

@onready var animated_choosing: AnimatedSprite2D = $"animated choosing"
@onready var ai_paper: TextureRect = $"ai paper"
@onready var rock_player: TextureRect = $"rock player"
@onready var paper_player: TextureRect = $"paper player"
@onready var scissors_player: TextureRect = $"scissors player"
@onready var flash: ColorRect = $flash
@onready var win_text: Label = $"win text"
@onready var winner = ""

func _ready() -> void:
	win_text.visible = false
	flash.modulate.a = 0
	if Globals.player1_choice == "rock":
		rock_player.visible = true
		paper_player.visible = false
		scissors_player.visible = false
	if Globals.player1_choice == "paper":
		rock_player.visible = false
		paper_player.visible = true
		scissors_player.visible = false
	if Globals.player1_choice == "scissors":
		rock_player.visible = false
		paper_player.visible = false
		scissors_player.visible = true
		
	var random_number = randi_range(1,3)
	if random_number == 1:
		Globals.ai_choice = "rock"
		animated_choosing.play("slow_to_rock")
		await animated_choosing.animation_finished
	elif random_number == 2:
		Globals.ai_choice = "paper"
		animated_choosing.play("slow_to_paper")
		await animated_choosing.animation_finished
	else:
		Globals.ai_choice = "scissors"
		animated_choosing.play("slow_to_scissors")
		await animated_choosing.animation_finished
	flash_screen()
	if Globals.ai_choice == "rock" and Globals.player1_choice == "paper":
		winner = "player1"
	elif Globals.ai_choice == "scissors" and Globals.player1_choice == "paper":
		winner = "ai"
	elif Globals.ai_choice == "paper" and Globals.player1_choice == "paper":
		winner = "tie"
	elif Globals.ai_choice == "rock" and Globals.player1_choice == "rock":
		winner = "tie"
	elif Globals.ai_choice == "scissors" and Globals.player1_choice == "rock":
		winner = "player1"
	elif Globals.ai_choice == "paper" and Globals.player1_choice == "rock":
		winner = "ai"
	elif Globals.ai_choice == "rock" and Globals.player1_choice == "scissors":
		winner = "player1"
	elif Globals.ai_choice == "scissors" and Globals.player1_choice == "scissors":
		winner = "tie"
	elif Globals.ai_choice == "paper" and Globals.player1_choice == "scissors":
		winner = "ai"
	if winner == "player1":
		win_text.visible = true
		win_text.text = "YOU WON!"
		Globals.wins += 1
	elif winner == "ai":
		win_text.visible = true
		win_text.text = "YOU LOST!"

func _process(delta: float) -> void:
	pass

func flash_screen():
	flash.modulate.a = 1
	var tween = create_tween()
	tween.tween_property(flash, "modulate:a", 0.0, 0.3)
