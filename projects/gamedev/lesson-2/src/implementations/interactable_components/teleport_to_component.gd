extends InteractableComponent

@export var tp_marker : Node2D

func on_interacted(body : PlayerBody):
	if !body:
		return
	
	print("interacted")
	body.global_position = tp_marker.global_position
	
	# Má prática, e se depois eu mudar e quiser colocar um fade away nos tps?
	# Queira tambem mexer na camera para ela não ter drag no tp, por isso
	# deveriamos deixar essa funçar ser dependente de body. 
	# Ou seja, deviamos ter feito body.teleport_to(global_pos : Vector2)
