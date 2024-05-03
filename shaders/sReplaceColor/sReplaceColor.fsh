uniform vec3 f_Colour1;
uniform vec3 f_Colour2;
uniform vec3 f_Colour3;
uniform vec3 f_Colour4;
uniform vec3 f_Colour5;
uniform vec3 f_Colour6;
uniform vec3 f_Colour7;
uniform vec3 f_Colour8;

uniform vec3 f_Replace1;
uniform vec3 f_Replace2;
uniform vec3 f_Replace3;
uniform vec3 f_Replace4;
uniform vec3 f_Replace5;
uniform vec3 f_Replace6;
uniform vec3 f_Replace7;
uniform vec3 f_Replace8;
uniform vec3 robes_colour_replace;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int u_blend_modes;
uniform sampler2D background_texture;

void main()
{
    vec3 robes_colour_base = vec3(201.0/255.0, 178.0/255.0, 147.0/255.0);
    vec3 robes_highlight = vec3(230.0/255.0, 203.0/255.0, 168.0/255.0);
    vec3 robes_darkness = vec3(189.0/255.0, 167.0/255.0, 138.0/255.0);
    vec3 robes_colour_base_2 = vec3(170.0/255.0, 150.0/255.0, 121.0/255.0);
    vec3 robes_highlight_2 = vec3(186.0/255.0, 165.0/255.0, 135.0/255.0);
    vec3 robes_darkness_2 = vec3(148.0/255.0, 132.0/255.0, 108.0/255.0);    
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    if( col.rgb == f_Colour1.rgb )
    {
        col.rgb = f_Replace1.rgb;
    }
    
    if( col.rgb == f_Colour2.rgb )
    {
        col.rgb = f_Replace2.rgb;
    }
    
    if( col.rgb == f_Colour3.rgb )
    {
        col.rgb = f_Replace3.rgb;
    }
    
    if( col.rgb == f_Colour4.rgb )
    {
        col.rgb = f_Replace4.rgb;
    }
    
    if( col.rgb == f_Colour5.rgb )
    {
        col.rgb = f_Replace5.rgb;
    }
    
    if( col.rgb == f_Colour6.rgb )
    {
        col.rgb = f_Replace6.rgb;
    }
    
    if( col.rgb == f_Colour7.rgb )
    {
        col.rgb = f_Replace7.rgb;
    }
    if( col.rgb == f_Colour8.rgb )
    {
        col.rgb = f_Replace8.rgb;
    }
    if( col.rgb == robes_colour_base.rgb || col.rgb == robes_colour_base_2.rgb )
    {
        col.rgb = vec3(robes_colour_replace.r+0.01, robes_colour_replace.g, robes_colour_replace.b).rgb;
    }
    if (col.rgb == robes_colour_base_2.rgb )
    {
        col.rgb = vec3(robes_colour_replace.r+0.01, robes_colour_replace.g, robes_colour_replace.b).rgb;
    }
    if (col.rgb == robes_highlight.rgb || col.rgb == robes_highlight_2.rgb){
        col.rgb = vec3(robes_colour_replace.r*1.25+0.01, robes_colour_replace.g*1.25, robes_colour_replace.b*1.25).rgb;
        //col.rgb = mix(robes_highlight.rgb, robes_colour_replace.rgb, 0.25);
    }
    if (col.rgb == robes_darkness.rgb || col.rgb == robes_darkness_2.rgb){
        //col.rgb = vec3(col.r*0.8, col.g*0.8, col.b*0.8).rgb;
        //col.rgb = robes_colour_replace.rgb;
        //col.rgb = mix(robes_darkness.rbg, robes_colour_replace.rgb, 0.25);
        col.rgb = vec3(robes_colour_replace.r*0.75+0.01, robes_colour_replace.g*0.75, robes_colour_replace.b*0.75).rgb;
    }
    if (u_blend_modes==1){
       vec4 background_col = texture2D( background_texture, v_vTexcoord );
       if (background_col.rgb == vec3(robes_colour_replace.r+0.01, robes_colour_replace.g, robes_colour_replace.b).rgb){
            col.a=0;
       }
       if (background_col.rgb == vec3(robes_colour_replace.r*1.25+0.01, robes_colour_replace.g*1.25, robes_colour_replace.b*1.25).rgb){
            col.a=0;
       }
       if (background_col.rgb == vec3(robes_colour_replace.r*0.75+0.01, robes_colour_replace.g*0.75, robes_colour_replace.b*0.75).rgb){
            col.a=0;
       }
       if (background_col.rgb != f_Replace1.rgb && background_col.rgb != f_Replace2.rgb && background_col.rgb != f_Replace3.rgb){
            col.a=0;
       }      
    }
    gl_FragColor = v_vColour * col;
}
