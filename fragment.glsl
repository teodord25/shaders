#version 300 es
precision mediump float;

in vec2 vTexCoord;

// outputs to the framebuffer
out vec4 outClr;

void main() {

    vec4 tl = vec4(1.0, 0.0, 0.0, 1.0);
    vec4 tr = vec4(0.0, 1.0, 0.0, 1.0);
    vec4 bl = vec4(0.0, 0.0, 1.0, 1.0);
    vec4 br = vec4(1.0, 1.0, 0.0, 1.0);

    vec4 c1 = mix(tl, tr, vTexCoord.x);
    vec4 c2 = mix(bl, br, vTexCoord.x);

    outClr = mix(c2, c1, vTexCoord.y);
}
