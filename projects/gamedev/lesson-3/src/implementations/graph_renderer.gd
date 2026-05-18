extends Control

@export_category("Styling")
@export var point_count: int = 100
@export_subgroup("Line Style")
@export var line_color: Color = Color.DODGER_BLUE
@export var line_width: float = 1.0
@export_subgroup("Progress Marker Style")
@export var marker_color: Color = Color.WHITE
@export var marker_width: float = 2.0
@export var marker_radius: float = 4.0

var current_trans : Tween.TransitionType = Tween.TRANS_LINEAR
var current_ease : Tween.EaseType = Tween.EASE_IN
var current_progress_index : int = 0

var points_cached: PackedVector2Array = []

# Aviso q isso daqui é código mais complexo, n se obrigue a entender,
# mas ele é bem tranquilo.

func _ready():
	SignalBus.updated_ease.connect(_on_updated_ease)
	SignalBus.updated_trans.connect(_on_updated_trans)
	SignalBus.updated_progress.connect(_on_progress_updated)
	_cache_points()

func _on_updated_ease(i : int):
	current_ease = i as Tween.EaseType
	queue_redraw()

func _on_updated_trans(i : int):
	current_trans = i as Tween.TransitionType
	queue_redraw()

func _on_progress_updated(percent : float):
	current_progress_index = clamp(int(percent * point_count), 0, point_count)
	queue_redraw()

func _draw() -> void:
	if latest_ease != current_ease or latest_trans != current_trans:
		_cache_points()
	
	# Desenhamos a polyline (linha do gráfico de movimento)
	draw_polyline(points_cached, line_color, line_width, true)
	
	draw_circle(points_cached[current_progress_index], marker_radius, marker_color, false, marker_width, true)

var latest_trans: Tween.TransitionType = Tween.TRANS_LINEAR
var latest_ease: Tween.EaseType = Tween.EASE_IN
func _cache_points():
	latest_ease = current_ease
	latest_trans = current_trans
	
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
	
	points_cached = points
