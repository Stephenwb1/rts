extends Node2D

var formations = {}
var current_formation_key = "box"

func _ready() -> void:
	formations["box"] = load("res://scripts/formations/formation_box.gd").new()
	formations["vsplit"] = load("res://scripts/formations/formation_vsplit.gd").new()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_B:
			current_formation_key = "box"
		if event.keycode == KEY_V:
			current_formation_key = "vsplit"

func assign_formation(units: Array, target: Vector2):
	var formation = formations[current_formation_key]
	var positions = formation.get_positions(units, target)
