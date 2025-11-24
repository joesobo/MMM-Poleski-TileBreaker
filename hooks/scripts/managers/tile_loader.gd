extends Object

func _load_tile_resources(chain: ModLoaderHookChain) -> void:
	chain.execute_next()

	var tile_loader: Node = chain.reference_object

	var floor_break_time = 4.0
	var glass_break_time = 2.0
	var ice_break_time = 2.0

	if ModLoaderConfig.has_current_config("Poleski-TileBreaker"):
		var config = ModLoaderConfig.get_current_config("Poleski-TileBreaker")
		if config and config.data:
			floor_break_time = config.data.get("floor_break_time", 4.0)
			glass_break_time = config.data.get("glass_break_time", 2.0)
			ice_break_time = config.data.get("ice_break_time", 2.0)

		tile_loader.tiles[TileState.TileType.FLOOR].break_time = floor_break_time
		tile_loader.tiles[TileState.TileType.GLASS].break_time = glass_break_time
		tile_loader.tiles[TileState.TileType.ICE].break_time = ice_break_time

	ModLoaderLog.info("TileBreaker: Applied break times - Floor: %ss, Glass: %ss, Ice: %ss" % [floor_break_time, glass_break_time, ice_break_time], "Poleski-TileBreaker")
