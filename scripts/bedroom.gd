extends Node2D

func _on_timeline_ended():
    Dialogic.Inputs.set_block_signals(false)

func _ready():
    Dialogic.timeline_ended.connect(_on_timeline_ended)

    if GlobalVariables.game_state["time_passage"] == "a_day_in_december" and not GlobalVariables.game_state["dialogues"]["has_shown_a_day_in_december"]:
        Dialogic.Inputs.set_block_signals(true)
        GlobalVariables.game_state["dialogues"]["has_shown_a_day_in_december"] = true
        Dialogic.start("a_day_in_december")