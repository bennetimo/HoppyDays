extends CanvasLayer
	
func set_life_count(lives):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives)
	
func update_lives(lives: int):
	set_life_count(lives)