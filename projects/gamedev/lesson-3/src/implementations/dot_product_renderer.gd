extends Panel

var target_position : Vector2

@export_category("Controls")
@export var point_count = 100
@export var radius : float = 256
@export var line_len : float = 128
 # vamos ir de 1 até -1 para cada ponto
var points_len : Array[float]

func _physics_process(delta):
	# vamos usar o get_global_mouse_position() para o nosso target
	var new_target_position = get_global_mouse_position()
	
	if target_position == new_target_position:
		return
		
	target_position = new_target_position
	
	calculate_dot_products()
	
	queue_redraw()

func calculate_dot_products():
	points_len.clear() # resetamos ele
	
	for i in range(point_count + 1):
		# valor de 0 -> 1
		var t := float(i) / float(point_count)
		
		# convertemos para ângulo indo de PI até -PI (trigonometria pro bgl girar)
		var angle : float = lerp(PI, -PI, t)
		
		# começamos da esquerda e rotacionamos
		var dir := Vector2.LEFT.rotated(angle)
		
		# direção até o mouse
		var to_target := (target_position - global_position - size/2).normalized()
		
		# dot product entre as duas direções
		var dot := dir.dot(to_target)
		
		points_len.append(dot)

func _draw():
	if points_len.is_empty():
		return

	var center := size / 2.0

	for i in range(points_len.size()):
		var t := float(i) / float(point_count)
		var angle :float= lerp(PI, -PI, t)

		# direção radial
		var dir := Vector2.LEFT.rotated(angle)

		# linha centrada no painel
		var start := center

		# extrude até o limite do raio
		var end : Vector2 = center + dir * (radius * abs(points_len[i]))

		# cor baseada no dot
		var color := Color.GREEN if points_len[i] >= 0.0 else Color.RED

		draw_line(start, end, color, 2.0)


		# Bug engraçado (bunda)
		## posição na circunferência
		#var origin := size / 2 + dir * radius
		#
		## desenha pra frente ou pra trás dependendo do dot
		#var end := origin + dir * (points_len[i] * line_len)
		#
		## verde se positivo, vermelho se negativo
		#var color := Color.GREEN if points_len[i] >= 0.0 else Color.RED
		#var half := dir * (points_len[i] * line_len * 0.5)
		#
		#draw_line(half, end, color, 2.0)
