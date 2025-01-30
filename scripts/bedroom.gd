extends Node2D

@onready var song = $Song

var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]
var has_shown_woke_up:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"]
    set(value): GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"] = value
var has_shown_returned_home:
    get: return GlobalVariables.game_state["story_progress"]["a_week_later"]["has_shown_returned_home"]
    set(value): GlobalVariables.game_state["story_progress"]["a_week_later"]["has_shown_returned_home"] = value

func show_initial_dialogue():
    if current_chapter == "a_day_in_december":
        if not has_shown_woke_up:
            has_shown_woke_up = true
            Dialogic.start("woke_up")
    elif current_chapter == "a_week_later":
        if not has_shown_returned_home:
            has_shown_returned_home = true
            Dialogic.start("returned_home_from_school")

func play_song():
    if current_chapter == "a_day_in_december":
        song.stream = load("res://assets/songs/a_day_in_december.mp3")
        song.play()

func _ready():
    show_initial_dialogue()
    play_song()
