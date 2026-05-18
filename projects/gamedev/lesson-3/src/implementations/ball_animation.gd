extends Control

@export var ball : TextureRect
@export var goals : Array[TextureRect]
@onready var len_goals = len(goals)

@export_category("Controls")
@export var tween_duration : float = 1
var goal_index = 0

# Aqui declaramos o tween que vamos usar para animar a bola.
var tween : Tween
# obs: podemos fazer mais de 1 animação por vez com ele, 
# só encadear tween properties.

var selected_transition : Tween.TransitionType = Tween.TRANS_LINEAR
var selected_ease : Tween.EaseType = Tween.EASE_IN

func _ready():
	var temp_pos := goals[goal_index].global_position
	ball.global_position = Vector2(temp_pos.x, temp_pos.y)
	_move_to_next_goal()

func _move_to_next_goal():
	goal_index += 1
	if goal_index >= len_goals:
		goal_index = 0
	
	_create_tween()

func _create_tween():
	if tween:
		# Sempre finalizamos o tween caso ele esteja ativo (boa prática)
		tween.kill()
	
	# criamos um tween antes de tudo
	tween = create_tween()
	# agora vamos animar uma "propriedade" da bola, essa sendo a posição global dela.
	tween.tween_property(
		ball, "global_position", # Aqui a gente referencia o caminho para a variavel.
		goals[goal_index].global_position, # Aqui é o valor final do nosso tween.
		tween_duration # Duração do nosso tween em segundos.
		)
	# Vamos definir a transição e ease deste tween.
	tween.set_trans(selected_transition)
	tween.set_ease(selected_ease)
	
	# por que usamos o await e não o connect?
	#   É devido que, ao darmos .kill() em um tween, ele é desreferenciado na memória. Por causa
	# disso, o connect só da certo por 1 ciclo de tween, sendo necessário que constantemente 
	# conecta-lo e desconecta-lo para não termos o famoso "memory leak".
	#   O await já faz isso pra gente, após ser usado já é limpo da memória automaticamente.
	await tween.finished
	_move_to_next_goal()
