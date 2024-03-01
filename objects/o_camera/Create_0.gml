debugCameraEnabled = false;

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
format = vertex_format_end();

follow_object = o_car;

skybox = new Model("assets/models/skybox.obj", "assets/models/skybox.mtl");
skybox.texture = sprite_get_texture(spr_skybox,0);

z = 28;

