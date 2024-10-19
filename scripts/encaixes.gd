extends Node

@onready var peca = $"../../"


func _on_mouse_entered() -> void:
	peca.encaixe = self
