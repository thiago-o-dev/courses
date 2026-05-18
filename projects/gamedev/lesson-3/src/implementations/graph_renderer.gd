extends Control

@export var point_count: int = 100
@export var line_color: Color = Color.CORNFLOWER_BLUE
@export var line_width: float = 1.0

var current_trans: Tween.TransitionType = Tween.TRANS_LINEAR
var current_ease: Tween.EaseType = Tween.EASE_IN

# Aviso q isso daqui é código mais complexo, n se obrigue a entender,
# mas ele é bem tranquilo.

func _ready():
	SignalBus.updated_ease.connect(_on_updated_ease)
	SignalBus.updated_trans.connect(_on_updated_trans)

func _on_updated_ease(i : int):
	current_ease = i as Tween.EaseType
	queue_redraw()

func _on_updated_trans(i : int):
	current_trans = i as Tween.TransitionType
	queue_redraw()

func _draw() -> void:
	# desenhamos nossa curva usando o espaço do owner
	var points: PackedVector2Array = [] # Array de posições, usado para meshs e linhas 2d no godot
	for i in range(point_count + 1):
		# Por isso usamos valores de 0 a 1, pois podemos prender o espaço de progresso se sabemos o numero
		# de operações que vamos fazer bem facilmente.
		var progress: float = float(i) / float(point_count)
		# Interpolamos um valor manualmente para termos nosso y
		var eased_y: float = Tween.interpolate_value(0.0, 1.0, progress, 1.0, current_trans, current_ease)
		
		var x_pos: float = progress * size.x
		# control começa no (0, 0) canto superior esquerdo, ai invertemos o Y
		var y_pos: float = size.y - (eased_y * size.y)
		
		points.append(Vector2(x_pos, y_pos))
	
	# Desenhamos a polyline
	draw_polyline(points, line_color, line_width, true)
