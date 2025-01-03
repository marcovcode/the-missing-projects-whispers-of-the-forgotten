extends Node2D

func _on_timeline_started():
    Dialogic.Inputs.set_block_signals(true)

func _on_timeline_ended():
    Dialogic.Inputs.set_block_signals(false)

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)

    if GlobalVariables.game_state["time_passage"] == "a_day_in_december":
        Dialogic.start("a_day_in_december")