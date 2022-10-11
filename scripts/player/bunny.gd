extends KinematicBody
class_name Bunny


var velocity: Vector3 = Vector3.ZERO
var snap_vector: Vector3 = Vector3.DOWN
onready var move_state: Node = $states/move
export var speed := 7.0


func _physics_process(delta: float) -> void:
  move_state.horizontal_movement()
  velocity = move_and_slide_with_snap(
    velocity,
    snap_vector,
    Vector3.UP,
    true
  )
