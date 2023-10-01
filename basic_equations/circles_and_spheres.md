# Circles and Spheres: Essential Equations

## Circle

A circle is a 2D shape described by the equation:

$(x - h)^2 + (y - k)^2 = r^2$

Where:
- \( (h, k) \) is the center of the circle.
- \( r \) is the radius.

In your shader, you used the equation with the circle centered at the origin:

$x^2 + y^2 = r^2$

### Points on the Circle

For a given \( x \) value, the \( y \) value of a point on the circle can be found as:

$y = \pm \sqrt{r^2 - x^2}$

## Sphere

A sphere is a 3D object described by the equation:

$(x - h)^2 + (y - k)^2 + (z - l)^2 = r^2$

Where:
- \( (h, k, l) \) is the center of the sphere.
- \( r \) is the radius.

When centered at the origin:

\[ x^2 + y^2 + z^2 = r^2 \]

### Points on the Sphere

Given \( x \) and \( y \) values, the \( z \) value of a point on the sphere (above or below the x-y plane) can be found as:

\[ z = \pm \sqrt{r^2 - x^2 - y^2} \]

In the shader you provided, you find the \( z \) value for a point on the upper half of the sphere using this equation.

## Normals on a Sphere

A normal vector on a sphere's surface always points out from the center to the point on the surface. Given a point \( (x, y, z) \) on the sphere's surface, the normal \( N \) at that point is:

\[ N = \frac{(x, y, z) - (h, k, l)}{r} \]

For a sphere centered at the origin, this simplifies to:

\[ N = \frac{(x, y, z)}{r} \]

In your shader, this concept is used to compute the normal for Phong shading.
