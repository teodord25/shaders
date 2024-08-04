#version 300 es

// vertex shader inputs automagically set by p5
in vec3 aPosition;
in vec2 aTexCoord;

// outputs to fragment shader
out vec4 vClr;

void main() {
    vClr = vec4(1.0, 0.0, 0.0, 1.0);

    // make vec4 with passed xyz and w = 1.0 for simplicity, w is used for like
    // projections and stuff? but its not needed rn
    vec4 pos = vec4(aPosition, 1.0);

    // map tex coords (0, 0) to (1, 1)
    // to clip space (-1, -1) to (1, 1)
    pos.xy = pos.xy * 2. - 1.;

    // make circle have padding
    pos.xy *= 0.5;

    // NOTE: this setup currently stretches what is drawn
    // to fill the screen, to have the geometry use the 
    // height and width that it is given, you have to 
    // multiply the pos by some funny matrices
    // uProjectionMatrix * uModelViewMatrix * pos

    gl_Position = pos;
}
