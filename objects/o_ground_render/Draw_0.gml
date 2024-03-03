if(o_camera.debugCameraEnabled){ exit; }

shader_set(sh_ground);
shader_set_uniform_f(_x, o_camera.x);
shader_set_uniform_f(_y, o_camera.y);

var s =  (2 * off) / sprite_get_width(s_placeholdertexture);

shader_set_uniform_f(size, 2 * off);
shader_set_uniform_f(grid_size, 128);
draw_sprite_ext(s_placeholdertexture, 0, o_camera.x - off, o_camera.y - off, s, s, 0,c_white,1);
shader_reset();