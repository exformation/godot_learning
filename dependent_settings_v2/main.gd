extends Node
signal setting_changed(key, value)

var settings = {}

func set_setting(key: StringName, value):
	if settings.get(key) != value:
		settings[key] = value
		setting_changed.emit(key, value)

func get_setting(key: StringName):
	return settings.get(key, null)
