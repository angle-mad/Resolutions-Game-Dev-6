extends Area2D

var players_inside := 0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		players_inside +=1
		check_teleport()


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		players_inside -=1

func check_teleport() -> void:
	if players_inside == 2:
		get_tree().change_scene_to_file.call_deferred("res://level_2.tscn")
