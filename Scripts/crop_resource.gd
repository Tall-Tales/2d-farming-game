class_name Crop
extends Resource

@export var harvest: Item
@export var growth_phase = Global.GrowthPhase.GERMINATING
@export var texture_resource: MappedTexture
@export var texture: AtlasTexture:
	get:
		return texture_resource.clip_texture(texture_resource.texture_frame + growth_phase)

@export_group("Germination Phase", "germination_")
@export_range(.5, 4, .5, "suffix:days") var germination_duration := 0.5

@export_group("Budding Phase", "budding_")
@export_range(.5, 4, .5, "suffix:days") var budding_duration := 0.5

@export_group("Flowering Phase", "flowering_")
@export_range(.5, 4, .5, "suffix:days") var flowering_duration := 0.5

@export_group("Maturation Phase", "maturation_")
@export_range(.5, 4, .5, "suffix:days") var maturation_duration := 0.5

func is_harvestable():
	return growth_phase == Global.GrowthPhase.MATURE

func advance_growth_phase():
	if growth_phase == Global.GrowthPhase.MATURE:
		return
	
	growth_phase += 1
	
	assert(growth_phase <= Global.GrowthPhase.MATURE)
