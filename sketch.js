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
	//
	const col1 = [1, 0, 1];
	const col2 = [0, 1, 1];
	// you have to concat the arrays into a single array and
	// the shader will treat it as a 2D array
	const colors = col1.concat(col2);

	shaderProgram.setUniform("colors", colors);
	rect(0, 0, width, height);
}
