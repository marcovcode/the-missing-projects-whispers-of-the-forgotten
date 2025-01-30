extends StaticBody2D

@onready var raycast = %Charlotte.get_node("RayCast2D")

var can_interact:
    get: return GlobalVariables.can_interact
var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]
var has_seen_colors:
    get: return GlobalVariables.game_state["story_progress"]["a_week_later"]["has_seen_colors"]
    set(value): GlobalVariables.game_state["story_progress"]["a_week_later"]["has_seen_colors"] = value

func _physics_process(delta):
    if raycast.is_colliding() and raycast.get_collider() == self:
        if Input.is_action_just_pressed("interact") and can_interact:
            if current_chapter == "a_week_later":
                Dialogic.start("flashing_colors")
                has_seen_colors = true
