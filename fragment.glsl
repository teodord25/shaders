#version 300 es
precision mediump float;

// outputs to the framebuffer
out vec4 outClr;

void main() {
    // set the fragment color to the color passed from the vertex shader
    outClr = vec4(1.0, 0.0, 0.0, 1.0);
}
