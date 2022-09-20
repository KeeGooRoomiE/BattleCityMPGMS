/// draw some player stats
draw_sprite(sprite_index, isLocalPlayer, x, y);

draw_set_color(c_white); draw_set_font(ftArial);
draw_set_halign(fa_center); draw_set_valign(fa_bottom);
draw_text(x, y - 64, "ID: " + string(playerId) + " / Username: " + string(username));