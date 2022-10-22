extends CanvasLayer
class_name Interface


onready var gems: Label = $gems
onready var coins: Label = $coins


func _ready() -> void:
  update_gems('0')
  update_coins('0')


func update_gems(value: String) -> void:
  gems.text = 'Gems: ' + value


func update_coins(value: String) -> void:
  coins.text = 'Coins: ' + value
