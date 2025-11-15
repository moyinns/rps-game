extends Node2D

@onready var animated_choosing: AnimatedSprite2D = $"animated choosing"
@onready var animated_choosing_1: AnimatedSprite2D = $"animated choosing 1"
@onready var flash: ColorRect = $flash
@onready var win_text: Label = $"win text"
@onready var winner = ""
@onready var title: Label = $title

func _ready() -> void:
	win_text.visible = false
	flash.modulate.a = 0
	if Globals.player1_choice == "rock":	# these if statements play the right animation depending on what object player1 choose
		animated_choosing_1.play("slow_to_rock")
	if Globals.player1_choice == "paper":
		animated_choosing_1.play("slow_to_paper")
	if Globals.player1_choice == "scissors":
		animated_choosing_1.play("slow_to_scissors")
	if Globals.player2_choice == "rock":	# these if statements play the right animation depending on what object player2 choose
		animated_choosing.play("slow_to_rock")
		await animated_choosing.animation_finished
	if Globals.player2_choice == "paper":
		animated_choosing.play("slow_to_paper")
		await animated_choosing.animation_finished
	if Globals.player2_choice == "scissors":
		Globals.ai_choice = "scissors"
		animated_choosing.play("slow_to_scissors")
		await animated_choosing.animation_finished
	flash_screen() # this plays a flash AFTER player2s choice has loaded in 
	
	if Globals.player2_choice == "rock" and Globals.player1_choice == "paper":	 # all these if statements determine who won
		winner = "player1"
	elif Globals.player2_choice == "scissors" and Globals.player1_choice == "paper":
		winner = "player2"
	elif Globals.player2_choice == "paper" and Globals.player1_choice == "paper":
		winner = "tie"
	elif Globals.player2_choice == "rock" and Globals.player1_choice == "rock":
		winner = "tie"
	elif Globals.player2_choice == "scissors" and Globals.player1_choice == "rock":
		winner = "player1"
	elif Globals.player2_choice == "paper" and Globals.player1_choice == "rock":
		winner = "player2"
	elif Globals.player2_choice == "rock" and Globals.player1_choice == "scissors":
		winner = "player1"
	elif Globals.player2_choice == "scissors" and Globals.player1_choice == "scissors":
		winner = "tie"
	elif Globals.player2_choice == "paper" and Globals.player1_choice == "scissors":
		winner = "player2"
	if winner == "player1":	 	# this if statement prints out the correct text depending on whowon, aswell as updating the win number
		win_text.visible = true
		win_text.text = "player 1 won!"
		Globals.wins += 1		# this is done assuming player1 is the owner/main player of the comp
		title.visible = false
	elif winner == "player2":
		win_text.visible = true
		win_text.text = "player 2 won!"
		title.visible = false
	else:
		win_text.visible = true
		win_text.text = "YOU TIED!"
		title.visible = false
		
	Globals.rounds_played += 1		# this inc the number of rounds played, so the comp knows whether to keep looping thro games
	
	await get_tree().create_timer(3).timeout
	if Globals.rounds_played < Globals.no_of_rounds: # this checks if all the numbers of rounds choosen have been played
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://main game screens/choose_item_screen.tscn")
	elif Globals.rounds_played == Globals.no_of_rounds: # this checks if the game is over
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://opening screen/opening_screen.tscn")

func _process(delta: float) -> void:
	pass

func flash_screen(): # this creates a tween for the flash screen
	flash.modulate.a = 1
	var tween = create_tween()
	tween.tween_property(flash, "modulate:a", 0.0, 0.3)
