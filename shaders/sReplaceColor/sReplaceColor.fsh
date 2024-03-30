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

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
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
    gl_FragColor = v_vColour * col;
}
