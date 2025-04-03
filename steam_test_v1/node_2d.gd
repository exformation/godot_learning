extends Node2D

func _ready() -> void:
	var steam_api = Engine.get_singleton("Steam")
	print(steam_api)
	var app_id = ProjectSettings.get_setting("steam/initialization/app_id")    
	var initialized : Dictionary = steam_api.steamInitEx(app_id,true)
	print("Did Steam initialize?: %s " % initialized)
