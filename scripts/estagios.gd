extends Node2D

@export var pecas_template : PackedScene


func _ready() -> void:
	var pasta_pecas_estagio = 'res://assets/imagens/pecas/' + str($".".name) + '/'
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
			if not dir.current_is_dir():
				var peca_textura = path + file_name
				colocar_textura_peca(file_name)
				var peca_atual = $".".get_child(-1) #vai pegar a ultima child adicionada
				peca_atual.mudar_textura(peca_textura) #acionar função para mudar textura
			file_name = dir.get_next()
			file_name = dir.get_next() #pular import
	else:
		print("An error occurred when trying to access the path.")
		

func colocar_textura_peca(nome):
	var nova_peca = pecas_template.instantiate()
	var nome_split = nome.split()
	var nome_peca = ""
	for i in range(3):
		nome_peca += nome_split[i]
	nova_peca.name = nome_peca
	nova_peca.global_position = $spawn_pecas.global_position
	$".".add_child(nova_peca)
