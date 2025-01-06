extends Node

var save_file_path = "user://save.data"
var can_interact = true
var is_transitioning = false

var game_state = {
    "charlotte": {
        "x": 30,
        "y": 93
    },

    "story_progress": {
        "current_chapter": "a_day_in_december",

        "a_day_in_december": {
            "has_shown_woke_up": false,
            "has_checked_diary": false,
            "knows_diary_code": false
        }
    }
}