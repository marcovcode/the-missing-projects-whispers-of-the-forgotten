extends Node

func _on_timeline_started():
    GlobalVariables.can_interact = false

func _on_timeline_ended():
    GlobalVariables.can_interact = true

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)