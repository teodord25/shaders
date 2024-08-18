#version 300 es
precision mediump float;

uniform vec3 colors[2];

in vec2 vTexCoord;

out vec4 outClr;

void main() {
    vec3 circle = vec3(0.5, 0.5, 0.3);

    float d = distance(vTexCoord, circle.xy) - circle.z;
    d = smoothstep(0., 0.01, d);

    outClr = vec4(d, d, d, 1.0);
}
