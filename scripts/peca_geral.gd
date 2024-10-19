extends Node2D

class_name Peca

@onready var estagio = $".."
@onready var area2d = $sprite/area
@onready var textura : Resource #vai pegar a textura do estagio atraves de load/preload no script do estagio.
@onready var sprite = $sprite
var draggable = false
var is_inside_dropable = false
var body_ref
var initialPos : Vector2
var offset : Vector2
var encaixe


func _on_ready() -> void:
	pass
	#sprite.texture = textura #atribui a textura que quiser ao carregar na cena


func _process(delta: float) -> void: 
	if draggable:	#codigo para arrastar com mouse e animação com tween
		if Input.is_action_just_pressed("click"):
			print(encaixe.name)
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
			
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_body_entered(body: Node2D) -> void: #Está em cima do buraco
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.MOCCASIN, 1)
		body_ref = body


func _on_area_body_exited(body: Node2D) -> void: #Está em cima do buraco
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.LEMON_CHIFFON, 0.7)


func _on_mouse_entered() -> void:
	if not Global.is_dragging:
		estagio.set_pecas_index_to_1()
		draggable = true
		self.z_index = 3 
		scale = Vector2(1.02, 1.02)


func _on_mouse_exited() -> void:
	if not Global.is_dragging:
		draggable = false
		self.z_index = 2 #a ultima peça sempre irá sobrepor as outras
		scale = Vector2(1, 1)
