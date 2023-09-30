void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Calculate the aspect ratio
    float aspectRatio = iResolution.x / iResolution.y;

    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = (fragCoord / iResolution.xy) * 2.0 - 1.0;
    
    // Correct for aspect ratio
    uv.x *= aspectRatio;
    
    // Circle equation
    float r = 0.4; // Radius of the circle
    float dist = dot(uv, uv);

    // Check if the pixel is inside the circle
    // Syntax: <condition> ? <value if true> : <value if false>
    vec3 color = dist < r*r ? vec3(0.0) : vec3(1.0);  // Black inside, white outside 

    fragColor = vec4(color, 1.0);
}

