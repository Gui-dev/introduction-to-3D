extends CanvasLayer
class_name Interface


onready var gems: Label = $gems
onready var coins: Label = $coins
onready var screen_shader: ColorRect = $screen_shader


func _ready() -> void:
  update_gems('0')
  update_coins('0')
  

func _process(_delta: float) -> void:
  if Input.is_action_just_pressed('ui_up'):
    screen_shader.visible = not screen_shader.visible


func update_gems(value: String) -> void:
  gems.text = 'Gems: ' + value


func update_coins(value: String) -> void:
  coins.text = 'Coins: ' + value
