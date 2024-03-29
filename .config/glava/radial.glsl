#define ALPHA 1.00

#define color1 #e7cadf
#define color2 #619ad7

/* center radius (pixels) */
#define C_RADIUS 260
/* center line thickness (pixels) */
#define C_LINE 0
/* outline color */
#define OUTLINE @bg:#00000000
/* number of bars (use even values for best results) */
#define NBARS 512
/* width (in pixels) of each bar*/
#define BAR_WIDTH 3.0
/* Amplify magnitude of the results each bar displays */
#define AMPLIFY 100
/* How quickly the gradient transitions, in pixels */
#define GRADIENT 70
/* Bar color. This is a gradient by default. */
#define COLOR @fg:mix(color2, color1, clamp(d / GRADIENT, 0, 1))

/* Angle (in radians) for how much to rotate the visualizer */
#define ROTATE (PI / -4)
/* Whether to swap left/right audio buffers, set to 1 to enable */
#define INVERT 0
/* Aliasing factors. Higher values mean more defined and jagged lines.
   Note: aliasing does not have a notable impact on performance, but requires
   `xroot` transparency to be enabled since it relies on alpha blending with
   the background. */
#define BAR_ALIAS_FACTOR 1.2
#define C_ALIAS_FACTOR 1.8
/* Offset (Y) of the visualization */
#define CENTER_OFFSET_Y 0
/* Offset (X) of the visualization */
#define CENTER_OFFSET_X 0

/* (DEPRECATED) outline color */
// #define BAR_OUTLINE OUTLINE
/* (DEPRECATED) outline width (in pixels, set to 0 to disable outline drawing) */
// #define BAR_OUTLINE_WIDTH 0


/* Gravity step, override from `smooth_parameters.glsl` */
// #request setgravitystep 4.0
