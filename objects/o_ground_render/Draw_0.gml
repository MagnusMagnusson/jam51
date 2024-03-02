shader_set(sh_ground);
shader_set_uniform_f(_x, o_car.x);
shader_set_uniform_f(_y, o_car.y);

var off = 7500;
var s =  (2 * off) / sprite_get_width(s_placeholdertexture);

shader_set_uniform_f(size, 2 * off);
shader_set_uniform_f(grid_size, 128);
draw_sprite_ext(s_placeholdertexture, 0, o_car.x - off, o_car.y - off, s, s, 0,c_white,1);
shader_reset();