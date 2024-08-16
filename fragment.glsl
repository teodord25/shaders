#version 300 es
precision mediump float;

in vec2 vTexCoord;

// outputs to the framebuffer
out vec4 outClr;

void main() {

    outClr = vec4(1.0, vTexCoord.x, 0.0, 1.0);
}
