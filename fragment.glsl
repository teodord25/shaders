#version 300 es
precision mediump float;

uniform vec2 u_resolution; // viewport resolution (width, height)
uniform float u_zoom;
uniform vec2 u_center;

in vec2 vTexCoord;

out vec4 outClr;

void main() {
    vec2 c = (vTexCoord - 0.5) * u_zoom - u_center;
    vec2 z = vec2(0.0);
    int i;
    for(i = 0; i < 1000; i++) {
        // z = z^2
        // (x + yi)^2 =
        // x^2 + 2xyi + y^2i^2 =
        // x^2 - y^2 + 2xyi
        // vec2(x^2 - y^2, 2xy) because x is real and y is imaginary
        // then just add c = x + yi = vec2(x, y)
        z = vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y) + c;
        if (dot(z, z) > 4.0) break;
    }
    float color = float(i) / 1000.0;
    outClr = vec4(vec3(color), 1.0);
}
