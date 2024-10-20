extends Control



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	

func _on_btn_sair_pressed() -> void:
	get_tree().quit()
	
	
func _unhandled_input(event):
	if event.is_action_pressed("f11"):
		if Global.fullscreen == true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			Global.fullscreen = false
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Global.fullscreen = true
