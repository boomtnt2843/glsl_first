precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 palette(float t) {
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.263, 0.416, 0.557);
    return a + b * cos(6.28318 * (c * t + d));
}

void main() {
    vec2 st = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / u_resolution.y;
    vec2 st0 = st;
    vec3 finalColor = vec3(0.0);

    for (float i = .0; i < 4.; i++) {
        st = fract(st * 1.5) - 0.5;

        float d = length(st) * exp(-length(st0));

        vec3 col = palette(length(st0) + i * .4 + u_time*.4);

        d = sin(d*8. + u_time) /8.;
        d = abs(d);

        d = pow(.01 / d, 1.2);

        finalColor += col * d;
    }
    
    gl_FragColor = vec4(finalColor, 1);
}