const std = @import("std");

pub const Void = @TypeOf({});

fn abc() Void {}
test "Void" {
    abc();
    try std.testing.expectEqual(0, @sizeOf(Void));
}
