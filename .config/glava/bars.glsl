/* Note: to only render a single channel, see `setmirror` in `rc.glsl`. */
#define ALPHA 0.9

#define color1 #e7cadf
#define color2 #599BDE

/* Center line thickness (pixels) */
#define C_LINE 0
/* Width (in pixels) of each bar */
#define BAR_WIDTH 4
/* Width (in pixels) of each bar gap */
#define BAR_GAP 1
/* Outline width (in pixels, set to 0 to disable outline drawing) */
#define BAR_OUTLINE_WIDTH 0
/* Amplify magnitude of the results each bar displays */
#define AMPLIFY 150
/* Whether the current settings use the alpha channel;
   enabling this is required for alpha to function
   correctly on X11 with `"native"` transparency */
#define USE_ALPHA 0
/* How quickly the gradient transitions, in pixels */
#define GRADIENT 120
/* Bar color. By default this provides a blue-white gradient. */
#define COLOR (@fg:mix(color2, color1, clamp(d / GRADIENT, 0, 1)))*ALPHA
/* Outline color. By default this provides a 'glint' outline based on the bar color */
#define BAR_OUTLINE @bg:vec4(COLOR.rgb * 1.5, COLOR.a)
/* Direction that the bars are facing, 0 for inward, 1 for outward */
#define DIRECTION 0
/* Whether to switch left/right audio buffers */
#define INVERT 0
/* Whether to flip the output vertically */
#define FLIP 0
/* Whether to mirror output along `Y = X`, causing output to render on the left side of the window */
/* Use with `FLIP 1` to render on the right side */
#define MIRROR_YX 0
/* Whether to disable mono rendering when `#request setmirror true` is set in `rc.glsl`. */
#define DISABLE_MONO 0
