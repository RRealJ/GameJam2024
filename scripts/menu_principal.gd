extends Control

@onready var opcoes = $Opcoes
@onready var menu = $menu
@onready var estagios = $menuEstagios

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	

func _on_btn_sair_pressed() -> void:
	get_tree().quit()
	

func _on_btn_opcoes_pressed() -> void:
	$titulo.text = "Opções"
	mostrar_esconder(opcoes, menu)

	
func _unhandled_input(event):
	if event.is_action_pressed("f11"):
		if Global.fullscreen == true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			Global.fullscreen = false
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Global.fullscreen = true


func mostrar_esconder(mostrar, esconder):
	mostrar.visible = true
	esconder.visible = false


func _on_voltar_pressed() -> void:
	$titulo.text = "Titulo Placeholder"
	mostrar_esconder(menu, opcoes)
	mostrar_esconder(menu, estagios)


func _on_btn_jogar_pressed() -> void:
	$titulo.text = "Estagios"
	mostrar_esconder(estagios, menu)
	
