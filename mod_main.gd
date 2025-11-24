extends Node

const MOD_DIR := "Poleski-TileBreaker"

func _init() -> void:
	var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	var hooks_dir := mod_dir_path.path_join("hooks")

	ModLoaderMod.install_script_hooks("res://scripts/managers/tile_loader.gd", hooks_dir.path_join("scripts/managers/tile_loader.gd"))

