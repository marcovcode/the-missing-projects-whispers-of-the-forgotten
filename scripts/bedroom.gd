extends Node2D

func _ready():
    if GlobalVariables.game_state["time_passage"] == "a_day_in_december":
        Dialogic.start("a_day_in_december")