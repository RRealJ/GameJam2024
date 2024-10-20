extends Node2D



func _ready() -> void:
	var pasta_pecas_estagio = 'res://assets/imagens/pecas/' + str($".".name)
	montar_pecas(pasta_pecas_estagio)
	


func set_pecas_index_to_1():  #Deixa todas as peças no z_index = 1
	var pecas = self.get_children()
	for p in pecas: 
		if p is Peca:
			p.z_index = 1
			print("z_index mudado para 1")
			
	
func montar_pecas(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
