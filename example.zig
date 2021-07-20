const std = @import("std");
const optional = @import("optional.zig");

pub fn main() !void {
    var opt = optional.valueOf(@as(u64, 10));
    std.log.info("{d}", .{opt});

    opt = optional.nullOf(u64);
    std.log.info("{d}", .{opt});
}
