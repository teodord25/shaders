#version 300 es
precision mediump float;

uniform float millis;

in vec2 vTexCoord;

// outputs to the framebuffer
out vec4 outClr;

void main() {

    vec2 p = vTexCoord;
    float x = (sin(p.x * 16.0 + millis / 500.) + 1.) / 2.;
    vec4 c = vec4(x, 0., 1.0, 1.0);

    outClr = c;
}
