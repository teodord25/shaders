#version 300 es
precision mediump float;

// inputs from vertex shader
in vec4 vClr;

// outputs to the framebuffer
out vec4 outClr;

void main() {
    // set the fragment color to the color passed from the vertex shader
    outClr = vClr;
}
