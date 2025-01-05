extends Node

var can_interact:
    set(value): GlobalVariables.can_interact = value

func _on_timeline_started():
    can_interact = false

func _on_timeline_ended():
    can_interact = true

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)
