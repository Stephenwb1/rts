extends Node2D

var selected_units: Array = [];

var drag_start: Vector2 = Vector2.ZERO
var drag_current: Vector2 = Vector2.ZERO
var is_dragging: bool = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			drag_start = to_local(get_global_mouse_position())
			is_dragging = true
		
			#clear unit selection on new click
			for unit in selected_units:
				unit.selected = false;
			selected_units.clear()
		
		else:
			#mouse released
			is_dragging = false
			var drag_end = get_global_mouse_position()
			var rect = Rect2(drag_start, drag_end - drag_start).abs()
			#select all units in rect
			for unit in get_children():
				if unit is CharacterBody2D:
					if rect.has_point(unit.global_position):
						unit.selected = true
						selected_units.append(unit)
		queue_redraw()
			
	#Right click
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		var click = get_global_mouse_position() # where I clicked
		for unit in selected_units:
			unit.target = click


func _process(_delta):
	drag_current = to_local(get_global_mouse_position())
	if is_dragging:
		queue_redraw()
		
func _draw():
	if is_dragging:
		var rect = Rect2(drag_start, drag_current - drag_start)
		draw_rect(rect, Color(0, 1, 0, 0.15), true)
		draw_rect(rect, Color(0, 1, 0, 0.8), false)
