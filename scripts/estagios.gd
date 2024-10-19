extends Node2D


func set_pecas_index_to_1():
	var pecas = self.get_children()
	for p in pecas:
		if p is Peca:
			p.z_index = 1
