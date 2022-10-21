extends RigidBody
class_name CollectableObject


func _on_animation_finished(_anim_name: String) -> void:
  queue_free()
