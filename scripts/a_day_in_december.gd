extends Node2D

func _on_timeline_started():
    Dialogic.Inputs.set_block_signals(true)

func _on_timeline_ended():
    Dialogic.Inputs.set_block_signals(false)
    get_tree().change_scene_to_file("res://scenes/bedroom.tscn")

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)
    
    Dialogic.start("a_day_in_december")