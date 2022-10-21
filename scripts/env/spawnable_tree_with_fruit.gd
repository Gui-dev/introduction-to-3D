extends BaseObject
class_name TreeWithFruit


var spawn_list: Array = [
  Vector2(-1, -0.5),
  Vector2(0.5, 1)
]
export(int) var spawn_gap
export(int) var spawn_height
export(int) var spawn_amount
export(PackedScene) var spawnable


func _ready() -> void:
  randomize()


func interact() -> void:
  animation.play('squash_and_stretch')
  var random_number: int = randi() % 100 + 1
  if random_number <= spawn_gap and  spawn_amount > 0:
    spawn_object()


func spawn_object() -> void:
  spawn_amount -= 1
  var random_x_index: int = randi() % spawn_list.size()
  var random_x_pposition: Vector2 = spawn_list[random_x_index]
  var random_z_index: int = randi() % spawn_list.size()
  var random_z_pposition: Vector2 = spawn_list[random_z_index]
  var object_to_spawn = spawnable.instance()
  get_tree().root.call_deferred('add_child', object_to_spawn)
  object_to_spawn.translation = Vector3(
    translation.x + rand_range(random_x_pposition.x, random_x_pposition.y),
    translation.y + spawn_height,
    translation.z + rand_range(random_z_pposition.x, random_z_pposition.y)
  )
