#version 300 es
precision mediump float;

const int numCircles = 50;
uniform vec3 circles[numCircles];
uniform float millis;

in vec2 vTexCoord;

out vec4 outClr;

void main() {
    // go through all circles and check if the current fragment is inside, if so, set color to 0
    float color = 1.0;
    for (int i = 0; i < numCircles; i++) {
        vec3 c = circles[i];
        c.x += 0.5 * sin(millis * 0.001 + float(i));
        c.z += 0.01 * sin(millis * 0.005 + float(i));
        float d = distance(vTexCoord, c.xy) - c.z;
        d = step(0., d);
        color *= d;
    }

    outClr = vec4(color, color, color, 1.0);
}
