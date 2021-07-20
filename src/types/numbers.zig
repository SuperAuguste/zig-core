const std = @import("std");

pub fn u(comptime bit_count: u16) type {
    return std.meta.Int(.unsigned, bit_count);
}

pub fn i(comptime bit_count: u16) type {
    return std.meta.Int(.signed, bit_count);
}

pub fn f(comptime bit_count: u16) type {
    return @Type(.{ .Float = .{ .bits = bit_count } });
}

test {
    try std.testing.expect(u32 == u(32));
    try std.testing.expect(i32 == i(32));
    try std.testing.expect(f32 == f(32));
}
