extends CharacterBody2D

var target: Vector2 = Vector2.ZERO
var speed: float = 150.0
var selected: bool = false

func _input(event):
    
    #left click = select
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        var click = get_global_mouse_position()
        selected = (global_position.distance_to(click) < 32.0)
        
    # right click to move if selected
    
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed and selected:
        target = get_global_mouse_position()
    
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
