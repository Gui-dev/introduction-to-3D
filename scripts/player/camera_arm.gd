extends SpringArm
class_name CameraArm


export(float) var mouse_sesitivity = 0.05


func _ready() -> void:
  set_as_toplevel(true)
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
  

func _process(_delta: float) -> void:
  if Input.is_action_just_pressed('ui_end'):
    get_tree().quit()
    

func _unhandled_input(event: InputEvent) -> void:
  if not event is InputEventMouseMotion:
    return
    
  rotation_degrees.x -= event.relative.y * mouse_sesitivity
  rotation_degrees.x = clamp(rotation_degrees.x, -90.0, -15.0)
  rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
