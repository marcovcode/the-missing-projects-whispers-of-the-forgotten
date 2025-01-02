extends Node

func deep_merge(target: Dictionary, source: Dictionary) -> void:
    for key in source:
        if key in target:
            if target[key] is Dictionary and source[key] is Dictionary:
                deep_merge(target[key], source[key])
            else:
                target[key] = source[key]
        else:
            target[key] = source[key]

func save_game():
    var save_file = FileAccess.open(GlobalVariables.save_file_path, FileAccess.WRITE)
    save_file.store_var(GlobalVariables.game_state)
    save_file.close()

func load_game():
    if FileAccess.file_exists(GlobalVariables.save_file_path):
        var save_file = FileAccess.open(GlobalVariables.save_file_path, FileAccess.READ)
        var loaded_state = save_file.get_var()
        save_file.close()
        
        var merged_state = GlobalVariables.game_state.duplicate(true)
        deep_merge(merged_state, loaded_state)
        GlobalVariables.game_state = merged_state
    else:
        save_game()

func _ready():
    load_game()