extends Spatial
class_name BunnyAnimator


var on_action: bool = false
onready var animation_player: AnimationPlayer = $AnimationPlayer
export(NodePath) onready var bunny = get_node(bunny) as KinematicBody 


func animate(velocity: Vector2) -> void:
  if on_action:
    return
    
  move_behavior(velocity)


func move_behavior(velocity: Vector2) -> void:
  if velocity != Vector2.ZERO:
    animation_player.play('Run')
    return
    
  animation_player.play('Idle')


func action_behavior(action: String) -> void:
  on_action = true
  animation_player.play(action)


func _on_animation_finished(anim_name: String) -> void:
  var action_condition: bool = (anim_name == 'Jump_Land')
  
  if anim_name == 'Jump':
    animation_player.play('Jump_Idle') 
  elif action_condition:
    on_action = false
    bunny.set_physics_process(true) 
