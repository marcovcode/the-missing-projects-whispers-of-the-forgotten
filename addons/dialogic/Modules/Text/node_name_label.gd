@icon("node_name_label_icon.svg")
extends Label

class_name DialogicNode_NameLabel

# If true, the label will be hidden if no character speaks.
@export var hide_when_empty := true
@onready @export var character_name: Node = %CharacterName
@export var use_character_color := true

func _ready() -> void:
    add_to_group('dialogic_name_label')
    if hide_when_empty:
        character_name.visible = false
    text = ""


func _set(property, what):
    if property == 'text' and typeof(what) == TYPE_STRING:
        text = what
        if hide_when_empty:
            character_name.visible = !what.is_empty()
        else:
            character_name.show()
        return true
