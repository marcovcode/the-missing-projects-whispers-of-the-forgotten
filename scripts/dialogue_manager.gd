extends Node

var can_interact:
    set(value): GlobalVariables.can_interact = value

func _on_timeline_started():
    can_interact = false

func _on_timeline_ended():
    can_interact = true

func _on_timeline_signal(argument):
    if argument == "show_diary_page":
        Transition.transition()
        await Transition.transition_finished
        get_tree().change_scene_to_file("res://scenes/show_diary_page.tscn")
    if argument == "check_post_it_pieces":
        PostIt.check_pieces()

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)
    Dialogic.signal_event.connect(_on_timeline_signal)
