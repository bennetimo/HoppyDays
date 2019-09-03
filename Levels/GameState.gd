extends Node2D

var lives = 3
var coins = 0
var target_coins_for_life = 3

func _ready():
	add_to_group("Gamestate")
	update_GUI()

func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives <= 0:
		end_game()
		
func coin_up():
	coins += 1
	update_GUI()
	var enough_coins = (coins % target_coins_for_life) == 0		
	if enough_coins:
		life_up()
		
func life_up():
	lives += 1
	update_GUI()
		
func update_GUI():
	get_tree().call_group("GUI", "update_gui", lives, coins)
		
func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
	
func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")
	