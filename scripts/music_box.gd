extends StaticBody2D

@onready var raycast = %Charlotte.get_node("RayCast2D")
@onready var song = $Song

var can_interact:
    get: return GlobalVariables.can_interact
var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]
var has_listened_to_song:
    get: return GlobalVariables.game_state["story_progress"]["a_week_later"]["has_listened_to_song"]
    set(value): GlobalVariables.game_state["story_progress"]["a_week_later"]["has_listened_to_song"] = value

func _on_timeline_signal(argument):
    if argument == "start_song":
        song.play()

func _ready():
    Dialogic.signal_event.connect(_on_timeline_signal)

func _physics_process(delta):
    if raycast.is_colliding() and raycast.get_collider() == self:
        if Input.is_action_just_pressed("interact") and can_interact:
            if current_chapter == "a_week_later":
                Dialogic.start("music_box_song")
                has_listened_to_song = true
            else:
                Dialogic.start("simple_music_box")
