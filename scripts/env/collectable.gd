extends Area
class_name Collectable


onready var collision: CollisionShape = $collision
export(int) var value_type
export(String) var collectable_type
export(NodePath) onready var animation = get_node(animation) as AnimationPlayer


func _on_collectable_area_body_entered(body: Node) -> void:
  if body is Bunny:
    collectable_action(body)


func collectable_action(body: KinematicBody) -> void:
  match collectable_type:
    'Fruit':
      body.update_health(value_type, 'increase')
    'Coin':
      GlobalData.update_coins()
    'BlueGem':
      GlobalData.update_gems()
  
  collision.disabled = true
  animation.play('dissolve')
