extends MeshInstance
class_name BunnyProjectile


var bunny: KinematicBody = null
export(int) var speed = 30
export(int) var damage = 3


func _physics_process(delta: float) -> void:
  var forward_direction: Vector3 = global_transform.basis.z.normalized()
  global_translate(forward_direction * speed * delta)


func _on_projectile_area_body_entered(body: Node) -> void:
  if body is StaticBody:
    body.owner.interact()
    queue_free()
  elif body is Enemy:
    body.update_health(damage)
    queue_free()



func _on_projectile_life_timer_timeout() -> void:
  queue_free()


