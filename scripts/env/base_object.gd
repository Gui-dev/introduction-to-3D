extends Spatial
class_name BaseObject


onready var animation: AnimationPlayer = $animation


func interact() -> void:
  animation.play('squash_and_stretch')
