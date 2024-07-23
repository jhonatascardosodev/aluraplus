extends Node2D

var game_over = false
var dog
var obstacle

func _ready():
	# Carregar e adicionar o cachorro e o obstáculo à cena
	var dog_scene = preload("res://dog.tscn")
	dog = dog_scene.instantiate()
	var obstacle_scene = preload("res://obstaculo.tscn")
	obstacle = obstacle_scene.instantiate()
	
	add_child(dog)
	add_child(obstacle)
	
	# Posicionar o cachorro e o obstáculo
	dog.position = Vector2(100, 400)
	obstacle.position = Vector2(400, 450)

func _process(delta):
	if game_over:
		return

	# Verificar se o cachorro passou o obstáculo
	if dog.position.x > obstacle.position.x:
		game_over = true
		print("Parabéns! O cachorro passou o obstáculo!")
