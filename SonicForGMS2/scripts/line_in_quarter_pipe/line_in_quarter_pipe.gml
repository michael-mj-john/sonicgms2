/// @description Checks if the given line crosses the given ellipse pipe
/// @argument {real} sx1 first line first point x-position
/// @argument {real} sy1 first line first point y-position
/// @argument {real} sx2 first line second point x-position
/// @argument {real} sy2 first line second point y-position
/// @argument {real} cx pipe centre point x-position
/// @argument {real} cy pipe centre point y-position
/// @argument {real} xrad pipe x-radius
/// @argument {real} yrad pipe y-radius
/// @returns {real} INTERSECT_NONE, INTERSECT_INSIDE or INTERSECT_OVERLAP
var sx1 = argument0;
var sy1 = argument1;
var sx2 = argument2;
var sy2 = argument3;
var cx = argument4;
var cy = argument5;
var xrad = argument6;
var yrad = argument7;

var result = INTERSECT_NONE;

var rectangle = line_in_rectangle(sx1, sy1, sx2, sy2, cx, cy, cx + xrad, cy + yrad);
var ellipse = line_in_ellipse(sx1, sy1, sx2, sy2, cx, cy, abs(xrad), abs(yrad));

if (rectangle != 0 and ellipse != 1) {
    if (ellipse == 0) {
        result = rectangle;
    } else if (rectangle == 1) {
        result = INTERSECT_OVERLAP;
    } else if (line_in_line(cx + xrad, cy, cx + xrad, cy + yrad, sx1, sy1, sx2, sy2) or
        line_in_line(cx, cy + yrad, cx + xrad, cy + yrad, sx1, sy1, sx2, sy2)) {
        result = INTERSECT_OVERLAP;
    } else if (point_in_quarter_pipe(sx1, sy1, cx, cy, xrad, yrad) or
        point_in_quarter_pipe(sx2, sy2, cx, cy, xrad, yrad)) {
        result = INTERSECT_OVERLAP;
    }
}

return result;