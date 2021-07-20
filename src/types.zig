const std = @import("std");

pub usingnamespace @import("types/bool.zig");
pub usingnamespace @import("types/numbers.zig");

pub const Void = @import("types/void.zig").Void;
pub const optional = @import("types/optional.zig");

test {
    std.testing.refAllDecls(@This());
}
