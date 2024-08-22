function main() {
        const canvas = document.querySelector('#glcanvas');

        const gl = canvas.getContext('webgl');

        if (!gl) {
            console.log('WebGL not supported :(');
        }


        // Vertex shader program
        const vsSource = `
            attribute vec4 aVertexPosition;
            uniform mat4 uModelViewMatrix;
            uniform mat4 uProjectionMatrix;
            void main() {
              gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
            }
        `;

        const fsSource = `
            void main() {
              gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
            }
        `;


        gl.clearColor(0.0, 1.0, 0.0, 1.0); // set the clear color to green
        gl.clear(gl.COLOR_BUFFER_BIT); // clear the buffer with the clear color
}

main();
