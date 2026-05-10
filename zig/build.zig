const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = build_executable(b, "hello-world", "src/01-hello-world.zig", target, optimize);
    _ = build_executable(b, "calculator", "src/02-calculator.zig", target, optimize);
    _ = build_executable(b, "number-guess", "src/03-number-guess.zig", target, optimize);
    _ = build_executable(b, "todo", "src/04-todo.zig", target, optimize);
    _ = build_executable(b, "palindrome", "src/05-palindrome.zig", target, optimize);
    _ = build_executable(b, "fizzbuzz", "src/06-fizzbuzz.zig", target, optimize);
}

fn build_executable(b: *std.Build, name: []const u8, source_file: []const u8, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode) *std.Build.Step.Compile {
    const exe = b.addExecutable(.{
        .name = name,
        .root_module = b.createModule(.{
            .root_source_file = b.path(source_file),
            .target = target,
            .optimize = optimize,
        }),
    });

    b.installArtifact(exe);
    return exe;
}
