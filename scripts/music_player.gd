extends Node

var song = AudioStreamPlayer.new()

var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]

func _ready():
    if current_chapter == "a_day_in_december":
        song.stream = load("res://assets/songs/a_day_in_december.mp3")

    song.volume_db = -5
    add_child(song)
    song.play()