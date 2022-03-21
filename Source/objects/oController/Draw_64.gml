/// Draw our stats
draw_set_color(c_yellow); draw_set_font(ftArial);
draw_set_halign(fa_left); draw_set_valign(fa_top);

draw_text(5, 5, "FPS: " + string(fps_real));
draw_text(5, 5, "\n" + "Ping: " + string(ping) + "ms");