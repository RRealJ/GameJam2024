extends Control


@onready var opt_btn = $video/checkers/resolucao

const DICT_RESOLUCOES : Dictionary = {
	"1024 x 768" : Vector2i(1024, 768),
	"1280 x 960" : Vector2i(1280, 960),
	"1440 x 900" : Vector2i(1440, 900),
	"1600 x 1050" : Vector2i(1600, 1050),
	"1920 x 1080" : Vector2i(1920, 1080)
}


func _ready():
	add_resolucao_items()
	opt_btn.item_selected.connect(on_resolution_selected)


func add_resolucao_items() -> void:
	for resolucao_tamanho in DICT_RESOLUCOES:
		opt_btn.add_item(resolucao_tamanho)


func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(DICT_RESOLUCOES.values()[index])
	

	
func _on_cb_fullscreen_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Global.fullscreen = true
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Global.fullscreen = false


func _on_cb_sem_bordas_toggled(toggled_on):
#	ConfigFileHandler.save_video_settings("fullscreen", toggled_on)
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	else:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)


func _on_cb_vsync_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
