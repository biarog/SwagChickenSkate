extends Resource
class_name PlayerData

@export var qtd_mixtapes : int = 0

#Vetores com colecionaveis coletados
@export var lvl_Mixtapes = [[1, false, false, false], 
							[2, false, false, false],
							[3, false, false, false]]


func update_qntd_mixtapes() -> void:
	for i in lvl_Mixtapes:
		for j in i:
			if j is bool && j :
				qtd_mixtapes += 1


func reset_save_data() -> void:
	qtd_mixtapes = 0
	for i in lvl_Mixtapes:
		for j in i:
			if j is bool:
				j = false
