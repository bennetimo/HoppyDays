extends CanvasLayer
	
func set_life_count(lives):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives)
	
func set_coin_count(coins):
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)	
	
func update_gui(lives: int, coins: int):
	set_life_count(lives)
	set_coin_count(coins)	