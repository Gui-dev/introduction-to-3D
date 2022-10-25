extends KinematicBody
class_name Enemy


var velocity: Vector3
var is_alive: bool = true
var health: float = 20
var max_health: float = 20
var damage: int = 5
var speed: int = 7
var gravity: float = 80.0
var y_direction: float = 0
onready var crab_texture: Spatial = $Crab
onready var raycast: RayCast = $raycast
onready var collision: CollisionShape = $hurtbox/collision
onready var attack_cooldown_timer: Timer = $hurtbox/attack_cooldown_timer


func _physics_process(delta: float) -> void:
  if not is_alive or GlobalData.player == null:
    return
  var is_colliding: bool = verify_collision()
  var move_direction: Vector3 = verify_movement(delta)
  velocity = move_direction * speed
  rotate_enemy(delta)


func rotate_enemy(delta: float) -> void:
  pass


func verify_movement(delta: float) -> Vector3:
  var player_direction = translation.direction_to(GlobalData.player.translation)
  var x_direction = player_direction.x
  var z_direction = player_direction.z
  y_direction -= gravity * delta
  return Vector3(x_direction, y_direction, z_direction)


func verify_collision() -> bool:
  if raycast.is_colliding() and raycast.get_collider().name == 'Bunny':
    return true
  return false


func update_health(value: int) -> void:
  if not is_alive:
    return
  health = clamp(health - value, 0, max_health)
  print(health)
  if health == 0:
    is_alive = false
    collision.disabled = true
    crab_texture.action_behavior('Death')
    return
  crab_texture.action_behavior('HitRecieve')
  

func _on_hurtbox_body_entered(body: Node) -> void:
  if body is Bunny:
    attack_cooldown_timer.start()
    collision.disabled = true
    body.update_health(damage, 'decrease')


func _on_attack_cooldown_timer_timeout() -> void:
  collision.disabled = false
