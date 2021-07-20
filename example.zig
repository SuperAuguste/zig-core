const std = @import("std");
const core = @import("core.zig");

pub fn main() !void {
    var opt = core.optional.valueOf(@as(u64, 10));
    std.log.info("{d}", .{opt});

    opt = core.optional.nullOf(u64);
    std.log.info("{d}", .{opt});
}
