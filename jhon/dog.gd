extends CharacterBody2D

# Variáveis de movimento
var speed = 200
var jump_force = -400
var gravity = 800

# Variáveis internas
var velocity_local = Vector2()

func _ready():
	# Inicialização (se necessário)
	pass

func _physics_process(delta):
	# Resetar a velocidade horizontal
	velocity_local.x = 0

	# Movimentação horizontal
	if Input.is_action_pressed("ui_right"):
		velocity_local.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity_local.x -= speed

	# Aplicar gravidade
	if not is_on_floor():
		velocity_local.y += gravity * delta

	# Pular
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity_local.y = jump_force

	# Movimentar e deslizar
	move_and_slide(velocity_local)

