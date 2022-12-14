extends Spatial


var on_action: bool = false
onready var animation: AnimationPlayer = $AnimationPlayer
export(NodePath) onready var parent = get_node(parent) as KinematicBody


func action_behavior(action: String) -> void:
  on_action = true
  animation.play(action)
  

func move_behavior(velocity: Vector3) -> void:
  if on_action:
    return
  elif velocity != Vector3.ZERO:
    animation.play('Walk')
    return
  animation.play('Idle')


func _on_animation_finished(anim_name: String) -> void:
  var action_codition: bool = (
    anim_name == 'HitReceive'  
  )
  
  if action_codition:
    on_action = false
    parent.set_physics_process(true)
