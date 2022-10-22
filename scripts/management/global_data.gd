extends Node


var coins: int = 0
var gems: int = 0


func update_coins() -> void:
  coins += 1
  get_tree().call_group('interface', 'update_coins', str(coins))


func update_gems() -> void:
  gems += 1
  get_tree().call_group('interface', 'update_gems', str(gems))
