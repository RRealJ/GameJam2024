extends Node2D

class_name Peca

@onready var area2d = $sprite/area
@onready var textura : Resource #vai pegar a textura do estagio atraves de load/preload
@onready var sprite = $sprite.texture


func _on_ready() -> void:
	$sprite.texture = textura #atribui a textura que quiser ao carregar na cena


func _on_area_entered(area) -> void: #quando entrar em area peca, fica vermelho
	if area is Peca:
		sprite.modulate = Color8(186, 8, 0, 45)
		

func _on_area_exited(area) -> void: #quando sair de area peca, fica normal
	if area is Peca:
		sprite.modulate = Color8(186, 8, 0, 0)
