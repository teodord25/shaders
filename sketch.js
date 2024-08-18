let shaderProgram;
let font;

function preload() {
	shaderProgram = loadShader("vertex.glsl", "fragment.glsl");
	font = loadFont("/Ldfcomicsans-jj7l.ttf");
}

function setup() {
	createCanvas(windowWidth, windowHeight, WEBGL);

	shader(shaderProgram);
	const numCircles = 50;
	const circles = [];
	for (let i = 0; i < numCircles; i++) {
		const x = random();
		const y = random();
		const r = random(0.01, 0.05);
		circles.push(x, y, r);
	}

	shaderProgram.setUniform("numCircles", numCircles);
	shaderProgram.setUniform("circles", circles);

	noStroke();
}

function draw() {
	clear();
	background(0);

	shaderProgram.setUniform("millis", millis());
	rect(0, 0, width, height);
}
