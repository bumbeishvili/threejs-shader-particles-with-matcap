uniform vec2 uResolution;
uniform sampler2D uPictureTexture;

attribute float aIntensity;
attribute float aAngle;

void main() {

    vec3 newPosition = position;
    vec4 modelPosition = modelMatrix * vec4(newPosition, 1.0);
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

    gl_PointSize = 0.015 * uResolution.y;
    gl_PointSize *= (1.0 / -viewPosition.z);
}