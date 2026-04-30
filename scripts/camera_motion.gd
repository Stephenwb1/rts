extends Camera2D

@export var scroll_speed: float = 400.0
@export var edge_margin: int = 20 #pixels from screen edge

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var viewport_size = get_viewport_rect().size
	var mouse = get_viewport().get_mouse_position()
	var direction = Vector2.ZERO
	
	#edge scrolling
	if mouse.x < edge_margin:
		direction.x -= 1
	if mouse.x > viewport_size.x - edge_margin:
		direction.x += 1
	if mouse.y < edge_margin:
		direction.y -= 1
	if mouse.y > viewport_size.y - edge_margin:
		direction.y += 1
		
	position += direction.normalized() * scroll_speed * delta
