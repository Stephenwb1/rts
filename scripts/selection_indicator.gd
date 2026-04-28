@tool
extends Node2D

@onready var unit = get_parent()
@export var visible_test: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_redraw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = unit.selected or visible_test
	queue_redraw()
	
func _draw():
	draw_ellipse(Vector2(0, 18), 20, 8, Color(0, 1, 0, 0.9), false, 2.0)
	draw_rect(Rect2(-20, 28, 40, 5), Color(0, 1, 0, 0.8))
	
	var hp_ratio = unit.current_hp / unit.max_hp
	draw_rect(Rect2(-20, 28, 40 * hp_ratio, 5), Color(0.6, 1, 0, 1))
