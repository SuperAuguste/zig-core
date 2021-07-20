const std = @import("std");
usingnamespace @import("numbers.zig");

pub const Bool = enum(u(1)) {
    @"false" = 0,
    @"true" = 1,

    pub fn toInt(self: Bool) u(1) {
        return @enumToInt(self);
    }

    pub fn fromInt(int: u(1)) Bool {
        return @intToEnum(Bool, int);
    }

    pub fn not(self: Bool) Bool {
        return fromInt(self.toInt() +% 1);
    }

    pub fn @"and"(a: Bool, b: Bool) Bool {
        return fromInt(a.toInt() & b.toInt());
    }

    pub fn @"or"(a: Bool, b: Bool) Bool {
        return fromInt(a.toInt() | b.toInt());
    }
};

const @"!" = Bool.not;

pub const @"true" = Bool.@"true";
pub const @"false" = Bool.@"false";

test "Bool" {
    var my_bool: Bool = @"true";

    try std.testing.expectEqual(@"true", my_bool);
    try std.testing.expectEqual(@"false", @"!"(my_bool));

    try std.testing.expectEqual(@"false", @"true".@"and"(@"false"));
    try std.testing.expectEqual(@"true", @"true".@"or"(@"false"));
}
