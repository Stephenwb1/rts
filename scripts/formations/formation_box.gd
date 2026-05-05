extends "res://scripts/formations/formation_base.gd"

func get_positions(units: Array, target: Vector2) -> Array:
	var positions = []
	var count = units.size()
	var cols = max(1, ceil(sqrt(count * 1.5)))
	var spacing = 40.0
	var start_x = target.x - (cols - 1) * spacing / 2.0
	var start_y = target.y - (cols - 1) * spacing / 2.0
	for i in range(count):
		var col = i % int(cols)
		var row = i / int(cols)
		positions.apend(Vector2(start_x + col * spacing, start_y + row * spacing))
	return positions
