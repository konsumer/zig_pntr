const std = @import("std");
const expect = std.testing.expect;

const c = @cImport({ @cInclude("pntr.h"); });

pub const Image = c.pntr_image;
pub const Color = c.pntr_color;
pub const Vector = c.pntr_vector;
pub const Rectangle = c.pntr_rectangle;
pub const Font = c.pntr_font;
pub const PixelFormat = c.pntr_pixelformat;
pub const Filter = c.pntr_filter;
pub const ImageType = c.pntr_image_type;
pub const Error = c.pntr_error;

// these are "dumb" wrappers, but they could be more complex (proper error-handling, etc)

pub const new_image = c.pntr_new_image;
pub const gen_image_color = c.pntr_gen_image_color;
pub const new_color = c.pntr_new_color;
pub const unload_image = c.pntr_unload_image;
pub const save_image = c.pntr_save_image;
pub const image_copy = c.pntr_image_copy;
pub const image_from_image = c.pntr_image_from_image;
pub const image_subimage = c.pntr_image_subimage;
pub const image_get_clip = c.pntr_image_get_clip;
pub const image_set_clip = c.pntr_image_set_clip;
pub const image_set_clip_rec = c.pntr_image_set_clip_rec;
pub const image_reset_clip = c.pntr_image_reset_clip;
pub const clear_background = c.pntr_clear_background;
pub const draw_point = c.pntr_draw_point;
pub const draw_point_vec = c.pntr_draw_point_vec;
pub const draw_points = c.pntr_draw_points;
pub const draw_line = c.pntr_draw_line;
pub const draw_line_curve = c.pntr_draw_line_curve;
pub const draw_line_vec = c.pntr_draw_line_vec;
pub const draw_line_vertical = c.pntr_draw_line_vertical;
pub const draw_line_horizontal = c.pntr_draw_line_horizontal;
pub const draw_rectangle = c.pntr_draw_rectangle;
pub const draw_rectangle_rec = c.pntr_draw_rectangle_rec;
pub const draw_rectangle_fill = c.pntr_draw_rectangle_fill;
pub const draw_rectangle_fill_rec = c.pntr_draw_rectangle_fill_rec;
pub const draw_rectangle_gradient = c.pntr_draw_rectangle_gradient;
pub const draw_rectangle_gradient_rec = c.pntr_draw_rectangle_gradient_rec;
pub const draw_triangle = c.pntr_draw_triangle;
pub const draw_triangle_vec = c.pntr_draw_triangle_vec;
pub const draw_triangle_fill = c.pntr_draw_triangle_fill;
pub const draw_triangle_fill_vec = c.pntr_draw_triangle_fill_vec;
pub const draw_ellipse = c.pntr_draw_ellipse;
pub const draw_ellipse_fill = c.pntr_draw_ellipse_fill;
pub const draw_circle = c.pntr_draw_circle;
pub const draw_circle_fill = c.pntr_draw_circle_fill;
pub const draw_polygon = c.pntr_draw_polygon;
pub const draw_polygon_fill = c.pntr_draw_polygon_fill;
pub const draw_polyline = c.pntr_draw_polyline;
pub const draw_arc = c.pntr_draw_arc;
pub const draw_arc_fill = c.pntr_draw_arc_fill;
pub const draw_rectangle_rounded = c.pntr_draw_rectangle_rounded;
pub const draw_rectangle_rounded_fill = c.pntr_draw_rectangle_rounded_fill;
pub const draw_image = c.pntr_draw_image;
pub const draw_image_rec = c.pntr_draw_image_rec;
pub const draw_image_tint = c.pntr_draw_image_tint;
pub const draw_image_tint_rec = c.pntr_draw_image_tint_rec;
pub const draw_image_rotated = c.pntr_draw_image_rotated;
pub const draw_image_rotated_rec = c.pntr_draw_image_rotated_rec;
pub const draw_image_flipped = c.pntr_draw_image_flipped;
pub const draw_image_flipped_rec = c.pntr_draw_image_flipped_rec;
pub const draw_image_scaled = c.pntr_draw_image_scaled;
pub const draw_image_scaled_rec = c.pntr_draw_image_scaled_rec;
pub const draw_text = c.pntr_draw_text;
pub const draw_text_len = c.pntr_draw_text_len;
pub const draw_text_wrapped = c.pntr_draw_text_wrapped;
pub const get_color = c.pntr_get_color;
pub const color_r = c.pntr_Color_r;
pub const color_g = c.pntr_Color_g;
pub const color_b = c.pntr_Color_b;
pub const color_a = c.pntr_Color_a;
pub const color_set_r = c.pntr_Color_set_r;
pub const color_set_g = c.pntr_Color_set_g;
pub const color_set_b = c.pntr_Color_set_b;
pub const color_set_a = c.pntr_Color_set_a;
pub const image_get_color = c.pntr_image_get_color;
pub const save_file = c.pntr_save_file;
pub const image_to_pixelformat = c.pntr_image_to_pixelformat;
pub const save_image_to_memory = c.pntr_save_image_to_memory;
pub const get_pixel_data_size = c.pntr_get_pixel_data_size;
pub const load_image = c.pntr_load_image;
pub const load_image_from_memory = c.pntr_load_image_from_memory;
pub const image_from_pixelformat = c.pntr_image_from_pixelformat;
pub const set_error = c.pntr_set_error;
pub const get_error = c.pntr_get_error;
pub const get_error_code = c.pntr_get_error_code;
pub const image_resize = c.pntr_image_resize;
pub const image_scale = c.pntr_image_scale;
pub const image_color_replace = c.pntr_image_color_replace;
pub const color_tint = c.pntr_Color_tint;
pub const image_color_tint = c.pntr_image_color_tint;
pub const color_fade = c.pntr_Color_fade;
pub const image_color_fade = c.pntr_image_color_fade;
pub const color_brightness = c.pntr_Color_brightness;
pub const get_pixel_color = c.pntr_get_pixel_color;
pub const set_pixel_color = c.pntr_set_pixel_color;
pub const load_font_default = c.pntr_load_font_default;
pub const unload_font = c.pntr_unload_font;
pub const font_copy = c.pntr_font_copy;
pub const font_scale = c.pntr_font_scale;
pub const load_font_bmf = c.pntr_load_font_bmf;
pub const load_font_bmf_from_image = c.pntr_load_font_bmf_from_image;
pub const load_font_bmf_from_memory = c.pntr_load_font_bmf_from_memory;
pub const measure_text = c.pntr_measure_text;
pub const measure_text_ex = c.pntr_measure_text_ex;
pub const gen_image_text = c.pntr_gen_image_text;
pub const load_font_tty = c.pntr_load_font_tty;
pub const load_font_tty_from_memory = c.pntr_load_font_tty_from_memory;
pub const load_font_tty_from_image = c.pntr_load_font_tty_from_image;
pub const load_file = c.pntr_load_file;
pub const unload_file = c.pntr_unload_file;
pub const load_file_text = c.pntr_load_file_text;
pub const unload_file_text = c.pntr_unload_file_text;
pub const load_font_ttf = c.pntr_load_font_ttf;
pub const load_font_ttf_from_memory = c.pntr_load_font_ttf_from_memory;
pub const color_invert = c.pntr_Color_invert;
pub const image_color_invert = c.pntr_image_color_invert;
pub const color_alpha_blend = c.pntr_Color_alpha_blend;
pub const image_alpha_border = c.pntr_image_alpha_border;
pub const image_crop = c.pntr_image_crop;
pub const image_alpha_crop = c.pntr_image_alpha_crop;
pub const image_color_brightness = c.pntr_image_color_brightness;
pub const image_flip = c.pntr_image_flip;
pub const color_contrast = c.pntr_Color_contrast;
pub const image_color_contrast = c.pntr_image_color_contrast;
pub const image_alpha_mask = c.pntr_image_alpha_mask;
pub const image_resize_canvas = c.pntr_image_resize_canvas;
pub const image_rotate = c.pntr_image_rotate;
pub const gen_image_gradient = c.pntr_gen_image_gradient;
pub const color_bilinear_interpolate = c.pntr_Color_bilinear_interpolate;
pub const load_memory = c.pntr_load_memory;
pub const unload_memory = c.pntr_unload_memory;
pub const memory_copy = c.pntr_memory_copy;
pub const get_file_image_type = c.pntr_get_file_image_type;
pub const draw_line_thick = c.pntr_draw_line_thick;
pub const draw_line_thick_vec = c.pntr_draw_line_thick_vec;
pub const draw_rectangle_thick = c.pntr_draw_rectangle_thick;
pub const draw_rectangle_thick_rec = c.pntr_draw_rectangle_thick_rec;
pub const draw_triangle_thick = c.pntr_draw_triangle_thick;
pub const draw_triangle_thick_vec = c.pntr_draw_triangle_thick_vec;
pub const draw_ellipse_thick = c.pntr_draw_ellipse_thick;
pub const draw_circle_thick = c.pntr_draw_circle_thick;
pub const draw_polygon_thick = c.pntr_draw_polygon_thick;
pub const draw_polyline_thick = c.pntr_draw_polyline_thick;
pub const draw_arc_thick = c.pntr_draw_arc_thick;
pub const draw_rectangle_thick_rounded = c.pntr_draw_rectangle_thick_rounded;
pub const draw_line_vertical_thick = c.pntr_draw_line_vertical_thick;
pub const draw_line_horizontal_thick = c.pntr_draw_line_horizontal_thick;
pub const draw_line_curve_thick = c.pntr_draw_line_curve_thick;
pub const put_horizontal_line_unsafe = c.pntr_put_horizontal_line_unsafe;
pub const draw_point_unsafe = c.pntr_draw_point_unsafe;

pub const LIGHTGRAY = Color{ .value=4291348680 };
pub const GRAY = Color{ .value=4286743170 };
pub const DARKGRAY = Color{ .value=4283453520 };
pub const YELLOW = Color{ .value=4278254077 };
pub const GOLD = Color{ .value=4278242303 };
pub const ORANGE = Color{ .value=4278231551 };
pub const PINK = Color{ .value=4290932223 };
pub const RED = Color{ .value=4281805286 };
pub const MAROON = Color{ .value=4281803198 };
pub const GREEN = Color{ .value=4281394176 };
pub const LIME = Color{ .value=4281310720 };
pub const DARKGREEN = Color{ .value=4281103616 };
pub const SKYBLUE = Color{ .value=4294950758 };
pub const BLUE = Color{ .value=4294015232 };
pub const DARKBLUE = Color{ .value=4289483264 };
pub const PURPLE = Color{ .value=4294933192 };
pub const VIOLET = Color{ .value=4290657415 };
pub const DARKPURPLE = Color{ .value=4286455664 };
pub const BEIGE = Color{ .value=4286820563 };
pub const BROWN = Color{ .value=4283394687 };
pub const DARKBROWN = Color{ .value=4281286476 };
pub const WHITE = Color{ .value=4294967295 };
pub const BLACK = Color{ .value=4278190080 };
pub const BLANK = Color{ .value=0 };
pub const MAGENTA = Color{ .value=4294902015 };
pub const RAYWHITE = Color{ .value=4294309365 };

test "generate color image" {
  const image = gen_image_color(100, 100, GOLD);
  defer unload_image(image);
  try expect(save_image(image, "output0.png"));
}

test "shapes" {
  const canvas = gen_image_color(400, 225, RAYWHITE);
  defer unload_image(canvas);

  // make some new colors from defined ones
  var LIGHTGREEN = GREEN;
  LIGHTGREEN.rgba.a = 180;
  var LIGHTBLUE = BLUE;
  LIGHTBLUE.rgba.a = 180;

  // Rectangles
  draw_rectangle_fill(canvas, 10, 30, 50, 50, RED);
  draw_rectangle_fill(canvas, 20, 40, 50, 50, LIGHTGREEN);
  draw_rectangle_fill(canvas, 30, 50, 50, 50, LIGHTGREEN);

  draw_rectangle_thick(canvas, 10, 120, 50, 50, 5, RED);
  draw_rectangle_thick(canvas, 20, 130, 50, 50, 5, GREEN);
  draw_rectangle_thick(canvas, 30, 140, 50, 50, 5, BLUE);

  // Circle
  draw_circle(canvas, 110, 60, 21, RED);
  draw_circle_fill(canvas, 160, 60, 21, BLUE);

  draw_ellipse(canvas, 110, 100, 20, 10, GREEN);
  draw_ellipse_fill(canvas, 160, 100, 20, 10, ORANGE);

  // Line
  draw_line(canvas, 200, 50, 250, 80, DARKGREEN);

  // Triangle
  draw_triangle_fill(canvas, 250, 50, 300, 80, 350, 20, PURPLE);

  // Rectangle Gradient
  draw_rectangle_gradient(canvas, 100, 120, 80, 80, RED, GREEN, BLUE, BLACK);

  var points:[4]Vector = undefined;

  // Polygon
  points[0] = Vector{.x=210, .y=110};
  points[1] = Vector{.x=215, .y=130};
  points[2] = Vector{.x=240, .y=140};
  points[3] = Vector{.x=200, .y=160};
  draw_polygon_fill(canvas, &points, 4, BLUE);
  draw_polygon(canvas, &points, 4, BLACK);

  // Arc
  const radius = 40;
  draw_arc_fill(canvas, 300, 120, radius, 90.0, 180.0, radius * 1.5, ORANGE);
  draw_arc(canvas, 300, 120, radius, 90.0, 180.0, radius * 1.5, RED);

  // Polyline
  points[0] = Vector{.x=240, .y=80};
  points[1] = Vector{.x=260, .y=100};
  points[2] = Vector{.x=220, .y=110};
  points[3] = Vector{.x=240, .y=130};
  draw_polyline(canvas, &points, 4, PURPLE);

  // Line Curve
  draw_line_curve(canvas, points[0], points[1], points[2], points[3], 40, DARKBLUE);

  try expect(save_image(canvas, "output1.png"));
}
