let shaderProgram;
let font;

function preload() {
	shaderProgram = loadShader("vertex.glsl", "fragment.glsl");
	font = loadFont("/Ldfcomicsans-jj7l.ttf");
}

function setup() {
	createCanvas(windowWidth, windowHeight, WEBGL);

	shader(shaderProgram);

	noStroke();
}

function draw() {
	clear();
	background(0);
	// width and height here are automatically set by p5.js to the size of the canvas ?

	shaderProgram.setUniform("millis", millis());
	ellipse(0, 0, width, height, 150);
}
