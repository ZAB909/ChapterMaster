varying vec2 v_vTexcoord;
uniform vec4 main_colour;
void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(texColor.rgb, main_colour.a);
}