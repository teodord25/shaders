#version 300 es
precision mediump float;

in vec2 vTexCoord;

// outputs to the framebuffer
out vec4 outClr;

void main() {

    vec2 p = vTexCoord;
    float x = (sin(p.x * 20.0) + 1.) / 2.;
    float y = (cos(p.y * 20.0) + 1.) / 2.;
    vec4 c = vec4(x, y, 1.0, 1.0);

    outClr = c;
}
