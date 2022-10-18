extends Node
class_name AttackState


const Projectile = preload('res://scenes/player/projectile.tscn')
onready var attack_cooldown_timer: Timer = $attack_cooldown_timer
onready var weapon_triggered_timer: Timer = $weapon_triggered_timer
export(NodePath) onready var bunny = get_node(bunny) as KinematicBody
export(NodePath) onready var character = get_node(character) as Spatial
export(NodePath) onready var projectile_spawner = get_node(projectile_spawner) as Position3D


func attack() -> void:
  if not bunny.is_on_floor():
    return
  elif Input.is_action_just_pressed('ui_shoot') and bunny.can_shoot:
    character.action_behavior('Idle_Shoot')
    bunny.is_weapon_triggered = true
    bunny.can_shoot =false
    attack_cooldown_timer.start()
    weapon_triggered_timer.start()
    spawn_projectile()
    
  
func spawn_projectile() -> void:
  var projectile = Projectile.instance()
  projectile.bunny = bunny
  get_tree().root.call_deferred('add_child', projectile)
  projectile.global_transform = projectile_spawner.global_transform
  

func _on_attack_cooldown_timer_timeout() -> void:
  bunny.can_shoot = true


func _on_weapon_triggered_timer_timeout() -> void:
  bunny.is_weapon_triggered = false
