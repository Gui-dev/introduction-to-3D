extends Node
class_name RolePlayState


export(NodePath) onready var bunny = get_node(bunny) as KinematicBody
export(NodePath) onready var character = get_node(character) as Spatial


func roleplay_action_handler() -> void:
  if not bunny.is_on_floor():
    return
  if Input.is_action_just_pressed('action_1'):
    character.roleplay_behavior('Duck')
  elif Input.is_action_just_pressed('action_2'):
    character.roleplay_behavior('No')
  elif Input.is_action_just_pressed('action_3'):
    character.roleplay_behavior('Yes')
  elif Input.is_action_just_pressed('action_4'):
    character.roleplay_behavior('Wave')
  elif Input.is_action_just_pressed('action_5'):
    character.roleplay_behavior('Punch')
  
