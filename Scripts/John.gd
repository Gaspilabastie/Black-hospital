extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $Sprite2D

@export var SPEED = 35.0

func _ready():
	anim_sprite.play()

func updateRotation(direction):
	anim_sprite.flip_h = direction.x < 0

func updateAnimation(direction):
	
	if direction == Vector2.ZERO:
		anim_sprite.animation = "Idle"
	
	if direction.y < 0:
		anim_sprite.play("Walking up")
	if direction.y > 0:
		anim_sprite.play("Walking down")
	if direction.x > 0:
		anim_sprite.play("Walking right")
	if direction.x < 0:
		anim_sprite.play("Walking left")
	
	updateRotation(direction)



func _physics_process(_delta):
	var direction: Vector2 = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	
	if velocity.y == 0:
		velocity.x = SPEED * direction.x
	if velocity.x == 0:
		velocity.y = SPEED * direction.y
	
	updateAnimation(velocity)
	
	move_and_slide()






