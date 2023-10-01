vec3 calculateNormal(in vec2 uv, in float r)
{
    float z = sqrt(r*r - dot(uv, uv));  // z = sqrt(r^2 - x^2 - y^2) for a sphere; r^2 = (x-h)^2 + (y-k)^2 + (z-l)^2 for a sphere centered at (h, k, l)
    return normalize(vec3(uv, z));  // Calculate and return the normal of this point on the sphere  
}

vec4 phongShading(in vec3 normal, in vec3 lightDir)
{
    // Diffuse shading: Calculate how much light hits the surface based on the angle
    // between the surface normal and the light direction.
    // (i.e. if angle between normal and lightDir is 0, then diffuse = 1.0 (max brightness))
    float diffuse = max(dot(normal, lightDir), 0.0);

    // Specular shading: Calculate specular highlights by reflecting the light direction
    // and viewing direction and computing the intensity using a shininess factor.
    vec3 viewDir = vec3(0.0, 0.0, 1.0);
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 16.0);

    // Set up colors for ambient, diffuse, and specular components.
    vec3 ambientColor = vec3(0.1, 0.1, 0.1);
    vec3 diffuseColor = diffuse * vec3(1.0, 1.0, 1.0);
    vec3 specColor = spec * vec3(1.0, 1.0, 1.0);

    // Return the final color as a combination of ambient, diffuse, and specular colors.
    return vec4(ambientColor + diffuseColor + specColor, 1.0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Calculate the aspect ratio
    float aspectRatio = iResolution.x / iResolution.y;

    // Normalize pixel coordinates to the range [-1, 1]
    vec2 uv = (fragCoord / iResolution.xy) * 2.0 - 1.0;

    // Correct for aspect ratio to ensure the circle appears round
    uv.x *= aspectRatio;

    // Define the radius and calculate the distance from the center of the circle
    float r = 0.4; // Radius of the circle
    float dist = dot(uv, uv);

    // Check if the current pixel is inside the circle
    if (dist < r*r)
    {
        // Calculate the normal vector for the point on the circle
        vec3 normal = calculateNormal(uv, r);
        
        // Define the direction of the light source (top-left)
        vec3 lightDir = normalize(vec3(-1.0, 1.0, 1.0));

        // Apply Phong shading to determine the final color for this pixel
        fragColor = phongShading(normal, lightDir);
    }
    else
    {
        // Set the pixel color to black if it's outside the circle
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);
    }
}
