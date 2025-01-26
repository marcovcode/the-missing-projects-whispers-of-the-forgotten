extends Node

var save_file_path = "user://save.data"
var can_interact = true
var is_transitioning = false

var game_state = {
    "charlotte": {
        "x": 118,
        "y": 45
    },

    "story_progress": {
        "current_chapter": "a_day_in_december",

        "a_day_in_december": {
            "has_shown_chapter_name": false,
            "has_shown_woke_up": false,
            "has_checked_diary": false,
            "has_found_basket_piece": false,
            "has_found_wardrobe_piece": false,
            "has_found_bed_piece": false,
            "knows_diary_code": false
        },

        "a_week_later": {
            "has_shown_chapter_name": false,
        }
    }
}