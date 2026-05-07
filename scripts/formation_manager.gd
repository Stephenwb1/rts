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
	
	#find optimal assignment
	var remaining_positions = positions.duplicate()
	var assigned = {}
	
	for unit in units:
		var best_pos = remaining_positions[0]
		var best_dist = unit.global_position.distance_to(best_pos)
		for pos in remaining_positions:
			var dist = unit.global_position.distance_to(pos)
			if dist < best_dist:
				best_dist = dist
				best_pos = pos
		assigned[unit] = best_pos
		remaining_positions.erase(best_pos)
	
	for unit in assigned:
		unit.set_target(assigned[unit])
	
	
	
	
	
	
