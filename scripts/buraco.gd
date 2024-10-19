extends StaticBody2D


func _ready() -> void:
	modulate = Color(Color.LEMON_CHIFFON, 0.7)


func _process(delta: float) -> void:
	if Global.is_dragging:
		visible = true
	else:
		visible = false
