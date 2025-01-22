extends Node2D

@onready var song = $Song

var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]
var has_shown_woke_up:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"]
    set(value): GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"] = value

func show_initial_dialogue():
    if current_chapter == "a_day_in_december":
        if not has_shown_woke_up:
            has_shown_woke_up = true
            Dialogic.start("woke_up")

func play_song():
    if current_chapter == "a_day_in_december":
        song.stream = load("res://assets/songs/a_day_in_december.mp3")
        song.play()

func _ready():
    show_initial_dialogue()
    play_song()
