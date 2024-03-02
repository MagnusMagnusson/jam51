precision mediump float;

varying vec2 TexCoords; // Assuming you're using varying instead of in


varying vec2 v_vTexcoord;
uniform float _x;
uniform float _y;
uniform float size;
uniform float grid_size;

float fade(float v){
	float a = -4.;
	return a * v * v - a * v;
}

void main()
{
	vec2 pos = vec2(_x, _y) + (size * v_vTexcoord);
	float xx = mod(pos.x, grid_size + grid_size);
	vec2 center = vec2(_x, _y) + (size * vec2(0.5, 0.5));
	float dis =  0.;
	
	vec4 col = xx < grid_size ? vec4(0.1, 0.8, 0.1, 1.) : vec4(0.1, 0.9, 0.1, 1.);
	float f = fade((v_vTexcoord.x + v_vTexcoord.y) / 2.);
	gl_FragColor = col * f *f * f;
}