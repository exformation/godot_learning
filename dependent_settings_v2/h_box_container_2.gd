extends HBoxContainer

# In FixedPaceSpeedContainer.gd
func _ready():
	Main.setting_changed.connect(_on_setting_changed)
	_on_setting_changed("pace", Main.get_setting("pace"))

func _on_setting_changed(key, value):
	visible = (key=='pace' and value=='fixed')
