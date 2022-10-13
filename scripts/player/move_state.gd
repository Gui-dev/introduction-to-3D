extends Node
class_name MoveState


export(NodePath) onready var bunny = get_node(bunny) as KinematicBody
export(NodePath) onready var camera_arm = get_node(camera_arm) as SpringArm


func horizontal_movement() -> void:
  var auxiliary_direction: Vector2 = Vector2.ZERO
  var move_direction: Vector3 = Vector3.ZERO
  
  auxiliary_direction = get_direction()
  move_direction.x = auxiliary_direction.x
  move_direction.z = auxiliary_direction.y
  move_direction = move_direction.rotated(Vector3.UP, camera_arm.rotation.y).normalized()
  
  bunny.velocity.x = move_direction.x * bunny.speed
  bunny.velocity.z = move_direction.z * bunny.speed


func get_direction() -> Vector2:
  return Vector2(
    Input.get_axis('ui_left', 'ui_right'),
    Input.get_axis('ui_up', 'ui_down')   
  )

  
func vertical_movement(delta: float) -> void:
  var just_landed: bool = bunny.is_on_floor() and bunny.snap_vector == Vector3.ZERO
  var is_jump: bool = bunny.is_on_floor() and Input.is_action_just_pressed('ui_select')
  bunny.velocity.y -= bunny.gravity * delta
  
  if is_jump:
    #  temp
    jump()
#    character.action_behavior('Jump')
  if just_landed and bunny.velocity.y < 0:
    bunny.snap_vector = Vector3.DOWN
#    character.action_behavior('Jump_Land')
#  if not character.on_action and abs(bunny.velocity.y) > 10.0:
#    character.action_behavior('Jump_Idle')
#    bunny.snap_vector = Vector3.ZERO



func jump() -> void:
  bunny.velocity.y = bunny.jump_speed
  bunny.snap_vector = Vector3.ZERO  
  
  
