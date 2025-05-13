class_name Item
extends Resource

@export var name: String
@export var texture_resource: MappedTexture
@export var texture: AtlasTexture:
	get:
		return texture_resource.clip_texture()
