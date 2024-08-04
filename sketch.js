let shaderProgram;

function preload() {
    shaderProgram = loadShader('vertex.vert', 'fragment.frag');
}

function setup() {
    createCanvas(windowWidth, windowHeight, WEBGL);
    noStroke();
}

function draw() {
    shader(shaderProgram);
// width and height here are automatically set by p5.js to the size of the canvas ?
    rect(0, 0, width, height);
}
