function pause() {
	instance_deactivate_all(true); instance_activate_layer("PauseMenu"); instance_activate_layer("ShopMenu");
	part_system_automatic_draw(0, false); part_system_automatic_update(0, false);
	part_system_automatic_draw(1, false); part_system_automatic_update(1, false);
	part_system_automatic_draw(global.ps_above, false); part_system_automatic_update(global.ps_above, false);
	part_system_automatic_draw(global.ps_below, false); part_system_automatic_update(global.ps_below, false);


}
