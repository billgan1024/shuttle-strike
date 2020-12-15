instance_activate_all(); instance_deactivate_layer("PauseMenu"); instance_deactivate_layer("ShopMenu");
part_system_automatic_draw(0, true); part_system_automatic_update(0, true);
part_system_automatic_draw(1, true); part_system_automatic_update(1, true);
part_system_automatic_draw(global.ps_above, true); part_system_automatic_update(global.ps_above, true);
part_system_automatic_draw(global.ps_below, true); part_system_automatic_update(global.ps_below, true);