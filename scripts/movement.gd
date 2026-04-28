extends CharacterBody2D

var target: Vector2 = Vector2.ZERO
var speed: float = 150.0
var selected: bool = false

var current_hp: int = 40
var max_hp: int = 40

func _physics_process(_delta: float) -> void:
	if target != Vector2.ZERO:
		var direction = global_position.direction_to(target)
		var distance = global_position.distance_to(target)
		if distance >  5.0:
			velocity = direction * speed
			move_and_slide()
		else: 
			velocity = Vector2.ZERO
			target = Vector2.ZERO
