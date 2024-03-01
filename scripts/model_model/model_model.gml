function Model(obj_file, mtl_file) constructor{
	model = load_obj(obj_file, mtl_file);
	texture = -1;
	
	static draw = function(_x,_y,_z, xrot, yrot, zrot, scale){
		matrix_set(matrix_world, matrix_build(_x, _y, _z, xrot, yrot, zrot, scale, scale, scale));
		vertex_submit(model, pr_trianglelist, texture);
		matrix_set(matrix_world, matrix_build_identity());
	};	
	
	static draw_ext = function(_x,_y,_z, xrot, yrot, zrot, xscale, yscale, zscale){
		matrix_set(matrix_world, matrix_build(_x, _y, _z, xrot, yrot, zrot, xscale, yscale, zscale));
		vertex_submit(model, pr_trianglelist, texture);
		matrix_set(matrix_world, matrix_build_identity());
	};
}