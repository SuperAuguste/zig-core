const std = @import("std");

pub fn Optional(comptime T: type) type {
    return union(enum) {
        const Self = @This();

        @"null": void,
        value: T,

        pub fn isNull(self: Self) bool {
            return self == .@"null";
        }

        pub fn getValue(self: Self) T {
            if (self.isNull()) @panic("Cannot access null value");
            return self.value;
        }

        pub fn format(value: Self, comptime fmt: []const u8, options: std.fmt.FormatOptions, writer: anytype) !void {
            _ = options;

            try if (value.isNull())
                writer.writeAll("null")
            else
                writer.print("{" ++ fmt ++ "}", .{value.value});
        }
    };
}

pub fn valueOf(value: anytype) Optional(@TypeOf(value)) {
    return Optional(@TypeOf(value)){ .value = value };
}

pub fn nullOf(comptime T: type) Optional(T) {
    return Optional(T){ .@"null" = {} };
}

// Test

pub fn optionalTest(z: bool) Optional(u32) {
    return if (z) .{ .value = 12 } else .@"null";
}

test {
    try std.testing.expectEqual(@as(u32, 12), optionalTest(true).getValue());
    try std.testing.expect(optionalTest(false).isNull());
}
