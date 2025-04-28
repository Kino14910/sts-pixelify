extends Node

func load(path: String):
	var resources = []

	var files = DirAccess.get_files_at(path)
	assert(files, "Direction path is error")
	
	for file in files:
		if file.get_extension() == "tres":
			var resource_path_full = path + file
			var resource = load(resource_path_full)
			
			if resource:
				resources.append(resource)
	return resources
