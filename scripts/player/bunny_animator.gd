extends Spatial
class_name BunnyAnimator


var suffix: String = ''
var on_action: bool = false
var on_roleplay_action: bool = false
onready var animation_player: AnimationPlayer = $AnimationPlayer
export(NodePath) onready var bunny = get_node(bunny) as KinematicBody 


func animate(velocity: Vector2) -> void:
  if on_action or on_roleplay_action:
    return
  move_behavior(velocity)


func move_behavior(velocity: Vector2) -> void:
  suffix = get_weapon_state()
  if velocity != Vector2.ZERO:
    animation_player.play('Run' + suffix)
    return    
  animation_player.play('Idle' + suffix)


func get_weapon_state() -> String:
  if bunny.is_weapon_triggered:
    return '_Gun'
    
  return ''


func action_behavior(action: String) -> void:
  on_action = true
  animation_player.play(action)


func roleplay_behavior(action: String) -> void:
  if on_action:
    return
  animation_player.play(action)
  on_roleplay_action = true
  bunny.set_physics_process(false)


func _on_animation_finished(anim_name: String) -> void:
  var action_condition: bool = (
    anim_name == 'Jump_Land' or
    anim_name == 'Idle_Shoot'
  )
  var roleplay_condition: bool = (
    anim_name == 'Duck' or
    anim_name == 'Yes' or
    anim_name == 'No' or
    anim_name == 'Wave' or
    anim_name == 'Punch'
  )
  
  if anim_name == 'Jump':
    animation_player.play('Jump_Idle') 
  elif action_condition:
    on_action = false
    bunny.set_physics_process(true) 
  elif roleplay_condition:
    on_roleplay_action = false
    bunny.set_physics_process(true)
