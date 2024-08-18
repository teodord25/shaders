#version 300 es
precision mediump float;

uniform vec2 u_resolution; // viewport resolution (width, height)
uniform float u_zoom;
uniform vec2 u_center;
uniform float millis;

in vec2 vTexCoord;

out vec4 outClr;

void main() {
    float zoom = 2.;
    vec2 center = u_center;
    center.x = center.x + 0.5;

    vec2 c = (vTexCoord - 0.5) * zoom - center;
    vec2 z = vec2(0.0);
    int i;
    for (i = 0; i < 1000; i++) {
        // z = z^2
        // (x + yi)^2 =
        // x^2 + 2xyi + y^2i^2 =
        // x^2 - y^2 + 2xyi
        // vec2(x^2 - y^2, 2xy) because x is real and y is imaginary
        // then just add c = x + yi = vec2(x, y)
        z = vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y) + c;
        if (dot(z, z) > 4.0) break;
    }
    float t = float(i) / 1000.0;

    vec3 color = vec3(
            0.5 + 0.5 * cos(3.0 + t * 6.28318530718),
            0.5 + 0.5 * cos(3.0 + t * 6.28318530718 + 2.09439510239),
            0.5 + 0.5 * cos(3.0 + t * 6.28318530718 + 4.18879020479)
        );

    outClr = vec4(color, 1.0);
}
