#version 300 es
precision mediump float;

in vec2 vTexCoord;

// outputs to the framebuffer
out vec4 outClr;

void main() {

    vec4 c1 = vec4(1.0, 1.0, 0.0, 1.0);
    vec4 c2 = vec4(0.0, 1.0, 1.0, 1.0);

    // linearly interpolates between c1 and c2,
    // vtexCoord.x is the index of where in the interpolation the output color should be
    outClr = mix(c1, c2, vTexCoord.x);
}
