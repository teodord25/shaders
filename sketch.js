let shaderProgram;
let font;

function preload() {
    shaderProgram = loadShader('vertex.vert', 'fragment.frag');
    font = loadFont('/Ldfcomicsans-jj7l.ttf');
}

function setup() {
    createCanvas(windowWidth, windowHeight, WEBGL);

    fill(0);
    textFont(font);
    text(webglVersion, 0, 0);

    noStroke();
}

function draw() {
//    clear();
// width and height here are automatically set by p5.js to the size of the canvas ?
    // rect(0, 0, width, height);
}
