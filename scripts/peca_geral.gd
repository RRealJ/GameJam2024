extends Node2D

class_name Peca

@onready var area = $sprite/area
@onready var textura : Resource #vai pegar a textura do estagio atraves de load/preload


func _on_ready() -> void:
	$sprite.texture = textura #atribui a textura que quiser ao carregar na cena
