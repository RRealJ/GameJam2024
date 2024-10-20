extends Node2D

@export var pecas_template : PackedScene
@export var buraco_template : PackedScene
@onready var qtd_buracos = 0 #multiplicar pelo offsset, antes de global_position
@onready var qtd_pecas = 0 
@onready var spawn_peca_offset = Vector2(0, 0)


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
				criar_bindar_buraco(peca_atual)
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
	nova_peca.global_position = $spawn_pecas.global_position - spawn_peca_offset
	spawn_peca_offset = Vector2(spawn_peca_offset[0], spawn_peca_offset[1] + 15)
	if qtd_pecas >= 45:
		spawn_peca_offset = Vector2(spawn_peca_offset[0], spawn_peca_offset[1] - 35)
		nova_peca.global_position = $spawn_pecas2.global_position - spawn_peca_offset
	qtd_pecas += 1
	$".".add_child(nova_peca)
	

func criar_bindar_buraco(peca):
	qtd_buracos += 1
	var novo_buraco = buraco_template.instantiate()
	novo_buraco.name = "b" + str(qtd_buracos)
	novo_buraco.vinculo_correto = peca.name

	
