extends KinematicBody
class_name Bunny


var velocity: Vector3 = Vector3.ZERO
var snap_vector: Vector3 = Vector3.DOWN
onready var character_with_gun: Spatial = $character_with_gun
onready var camera_arm: SpringArm = $camera_arm
onready var move_state: Node = $states/move
export var speed := 7.0
export(float) var gravity = 50.0
export(float) var jump_speed = 20.0
export(float) var rotation_speed = 5.0


func _process(_delta: float) -> void:
  camera_arm.translation = translation


func _physics_process(delta: float) -> void:
  move_state.horizontal_movement()
  move_state.vertical_movement(delta)
  velocity = move_and_slide_with_snap(
    velocity,
    snap_vector,
    Vector3.UP,
    true
  )
  rotate_character(delta)
  character_with_gun.animate(Vector2(velocity.x, velocity.z))


func rotate_character(delta: float) -> void:
  if Vector2(velocity.z, velocity.x).length() > 0.2:
    var look_direction: Vector2 = Vector2(velocity.z, velocity.x)
    rotation.y = lerp_angle(rotation.y, look_direction.angle(), delta * rotation_speed)
