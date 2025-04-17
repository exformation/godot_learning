extends OptionButton

func _on_item_selected(index):
	Main.set_setting("pace", text)
