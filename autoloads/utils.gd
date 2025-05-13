extends Node


func load_res_from_dir(path: String) -> Array[Resource]:
	var resources: Array[Resource] = []

	var files = DirAccess.get_files_at(path)
	assert(files, "Direction path is error")
	
	for file in files:
		if file.get_extension() == "tres":
			var resource_path_full = path + file
			var resource = load(resource_path_full)
			
			if resource:
				resources.append(resource)
	return resources


# 角色抖动动画
func shake(thing: Node2D, strength: float, duration: float = 0.2) -> void:
	if not thing:
		return

	var orig_pos = thing.position
	var shake_count = 10
	var tween = create_tween()
	
	for i in shake_count:
		var shake_offset = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))
		var target = orig_pos + strength * shake_offset
		if i % 2 == 0: 
			target = orig_pos
		tween.tween_property(thing, "position", target, duration / float(shake_count))
		strength *= 0.75
	
	tween.finished.connect(
		func(): 
			if thing:
				thing.position = orig_pos
	)


func fetch_json_data(path: String) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	return data


func get_keywords_color(desc: String, lang: String = 'zhs') -> String:
	var keywords: Dictionary = fetch_json_data('res://localization/'+ lang + '/keywords.json')
	for word in desc.split(" "):
		if keywords.has(word):
			desc = desc.replace(' %s ' % [word], "[color=gold]%s[/color]" % [word])
	return desc
