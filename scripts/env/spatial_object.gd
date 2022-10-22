extends Spatial
class_name SpatialObject




func _on_animation_finished(_anim_name: String) -> void:
  queue_free()
