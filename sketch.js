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

	shaderProgram.setUniform("u_resolution", [width, height]);
	shaderProgram.setUniform("u_zoom", 2);
	shaderProgram.setUniform("u_center", [.5, 0]);
}

function draw() {
	clear();
	background(0);

	shaderProgram.setUniform("millis", millis());
	rect(0, 0, width, height);
}
