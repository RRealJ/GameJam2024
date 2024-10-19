extends Node2D

class_name Peca

@onready var area = $textura/area
@onready var textura : Resource

func _on_ready() -> void:
	$sprite.texture = textura #atribui a textura que quiser ao carregar na cena
