shader_set(sh_ground);
var my_car = Players().human();
shader_set_uniform_f(_x, my_car.x);
shader_set_uniform_f(_y, my_car.y);

var off = 7500;
var s =  (2 * off) / sprite_get_width(s_placeholdertexture);

shader_set_uniform_f(size, 2 * off);
shader_set_uniform_f(grid_size, 128);
draw_sprite_ext(s_placeholdertexture, 0, my_car.x - off, my_car.y - off, s, s, 0,c_white,1);
shader_reset();