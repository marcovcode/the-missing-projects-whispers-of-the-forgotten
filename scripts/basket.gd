extends StaticBody2D

@onready var raycast = %Charlotte.get_node("RayCast2D")

var can_interact:
    get: return GlobalVariables.can_interact
var has_checked_diary:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_checked_diary"]
var has_found_basket_piece:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_found_basket_piece"]
    set(value): GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_found_basket_piece"] = value

func _physics_process(delta):
    if raycast.is_colliding() and raycast.get_collider() == self:
        if Input.is_action_just_pressed("interact") and can_interact:
            if has_checked_diary:
                if has_found_basket_piece:
                    Dialogic.start("theres_only_trash")
                else:
                    has_found_basket_piece = true
                    Dialogic.start("found_basket_piece")
            else:
                Dialogic.start("theres_only_trash")
