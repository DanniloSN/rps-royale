extends Node

func _ready():
	$Control/TextEdit.text = str(Globals.instances)

func _on_text_edit_text_changed():
	Globals.instances = int($Control/TextEdit.text)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
