extends CharacterBody2D

@export var speed: float = 150.0
@export var selected: bool = false
@export var current_hp: int = 40
@export var max_hp: int = 40

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

func _ready():
	nav_agent.path_desired_distance = 4.0
	nav_agent.target_desired_distance = 4.0
			
func set_target(pos: Vector2):
	nav_agent.target_position = pos

func _physics_process(_delta: float) -> void:
	if nav_agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return
	var next_pos = nav_agent.get_next_path_position()
	var direction = global_position.direction_to(next_pos)
	velocity = direction * speed
	move_and_slide()
