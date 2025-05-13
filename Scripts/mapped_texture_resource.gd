class_name MappedTexture
extends Resource

@export_group("Texture", "texture_")
@export var texture_resource: Texture2D
@export var texture_hframes: int
@export var texture_vframes: int
@export var texture_frame: int

func clip_texture(frame: int = texture_frame):
	var texture_width = texture_resource.get_width() / texture_hframes
	var texture_height = texture_resource.get_height() / texture_vframes
	var texture_size = Vector2(texture_width, texture_height)
	var texture_position = Vector2(frame * texture_size.x, 0)
	var texture_region = Rect2(texture_position, texture_size)
	
	var atlas_texture = AtlasTexture.new()
	atlas_texture.atlas = texture_resource
	atlas_texture.region = texture_region
	
	return atlas_texture
