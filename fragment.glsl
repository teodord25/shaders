#version 300 es
precision mediump float;

uniform vec3 colors[2];

in vec2 vTexCoord;

out vec4 outClr;

void main() {
    vec4 c = vec4(colors[1], 1.);

    outClr = c;
}
