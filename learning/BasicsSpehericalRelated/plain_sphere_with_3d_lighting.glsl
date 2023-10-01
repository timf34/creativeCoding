vec3 calculateNormal(in vec2 uv, in float r)
{
    float z = sqrt(r*r - dot(uv, uv));  // z = sqrt(r^2 - x^2 - y^2) for a sphere; r^2 = (x-h)^2 + (y-k)^2 + (z-l)^2 for a sphere centered at (h, k, l)
    return normalize(vec3(uv, z));  // Calculate and return the normal of this point on the sphere
}

vec4 phongShading(in vec3 normal, in vec3 lightDir)
{
    // Diffuse shading
    float diffuse = max(dot(normal, lightDir), 0.0);

    // Specular shading
    vec3 viewDir = vec3(0.0, 0.0, 1.0);
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 16.0);

    // Ambient color
    vec3 ambientColor = vec3(0.1, 0.1, 0.1);
    // Diffuse color
    vec3 diffuseColor = diffuse * vec3(1.0, 1.0, 1.0);
    // Specular color
    vec3 specColor = spec * vec3(1.0, 1.0, 1.0);

    return vec4(ambientColor + diffuseColor + specColor, 1.0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
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

    if (dist < r*r)
    {
        vec3 normal = calculateNormal(uv, r);
        vec3 lightDir = normalize(vec3(-1.0, 1.0, 1.0)); // Directional light coming from the top-left
        fragColor = phongShading(normal, lightDir);
    }
    else
    {
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);
    }
}
