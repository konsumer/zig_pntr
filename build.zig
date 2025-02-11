const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "pntr",
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("src/pntr.zig"),
    });

    lib.addCSourceFile(.{
        .file = b.path("src/pntr.c"),
        .flags = &[_][]const u8{"-std=c99"},
    });
    lib.addIncludePath(b.path("src/pntr"));

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
