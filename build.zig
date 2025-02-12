const std = @import("std");

pub const PixelOrder = enum { RGBA, ARGB };

pub const Options = struct {
    pixel_order: PixelOrder = .RGBA,
    default_font: bool = true,
    ttf: bool = true,
    utf8: bool = true,
    math: bool = true,
};

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const defaults = Options{};
    const options = Options{
        .pixel_order = b.option(PixelOrder, "pixel_order", "Pixel order: RGBA or ARGB") orelse defaults.pixel_order,
        .default_font = b.option(bool, "default_font", "Embed default-font") orelse defaults.default_font,
        .ttf = b.option(bool, "ttf", "Use TTF fonts") orelse defaults.ttf,
        .utf8 = b.option(bool, "utf8", "Enable UTF8 support") orelse defaults.utf8,
        .math = b.option(bool, "math", "Use math standard library (or built-in)") orelse defaults.math,
    };

    const lib = b.addStaticLibrary(.{
        .name = "pntr",
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("src/pntr.zig"),
    });

    var pntr_flags_arr = std.ArrayList([]const u8).init(b.allocator);
    defer pntr_flags_arr.deinit();

    try pntr_flags_arr.appendSlice(&[_][]const u8{
        "-std=c99",
    });

    if (options.pixel_order == PixelOrder.RGBA) {
        try pntr_flags_arr.appendSlice(&[_][]const u8{"-DPNTR_PIXELFORMAT_RGBA"});
    } else {
        try pntr_flags_arr.appendSlice(&[_][]const u8{"-DPNTR_PIXELFORMAT_ARGB"});
    }

    if (options.default_font) {
        try pntr_flags_arr.appendSlice(&[_][]const u8{"-DPNTR_ENABLE_DEFAULT_FONT"});
    }

    if (options.ttf) {
        try pntr_flags_arr.appendSlice(&[_][]const u8{"-DPNTR_ENABLE_TTF"});
    }

    if (options.utf8) {
        try pntr_flags_arr.appendSlice(&[_][]const u8{"-DPNTR_ENABLE_UTF8"});
    }

    if (options.math) {
        try pntr_flags_arr.appendSlice(&[_][]const u8{"-DPNTR_ENABLE_MATH"});
    }

    lib.addIncludePath(b.path("src/pntr"));
    lib.addCSourceFile(.{
        .file = b.path("src/pntr.c"),
        .flags = pntr_flags_arr.items,
    });

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/pntr.zig"),
        .target = target,
        .optimize = optimize,
    });
    lib_unit_tests.addIncludePath(b.path("src/pntr"));
    lib_unit_tests.linkLibrary(lib);

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
}
