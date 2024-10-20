extends StaticBody2D

@onready var vinculo : String
@onready var peca_correta = false

func _ready() -> void:
	modulate = Color(Color.LEMON_CHIFFON, 0.7)


func _process(delta: float) -> void:
	if Global.is_dragging:
		visible = true
	else:
		visible = false


#func _on_area_2d_area_entered(area: Area2D) -> void:
#	if area.get_tree().get_root().name == vinculo:
#		peca_correta = true
#	else:
#		peca_correta = false


#func _on_area_2d_area_exited(area: Area2D) -> void:
#	if area.get_tree().get_root().name == vinculo:
#		peca_correta = false
