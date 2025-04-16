local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local T_VECTORS, T_ARRAYS
--- Flattens the specified array of points onto a unit vector axis,
-- resulting in a one dimensional range of the minimum and
-- maximum value on that axis.
-- 
-- @param points The points to flatten.
-- @param normal The unit vector axis to flatten on.
-- @param result An array.  After calling this function,
-- result[0] will be the minimum value,
-- result[1] will be the maximum value.
function ____exports.flattenPointsOn(points, normal, result)
    local min = 2 ^ 1024
    local max = -2 ^ 1024
    local len = #points
    do
        local i = 0
        while i < len do
            local dot = points[i + 1]:dot(normal)
            if dot < min then
                min = dot
            end
            if dot > max then
                max = dot
            end
            i = i + 1
        end
    end
    result[1] = min
    result[2] = max
end
--- Check whether two convex polygons are separated by the specified
-- axis (must be a unit vector).
-- 
-- @param aPos The position of the first polygon.
-- @param bPos The position of the second polygon.
-- @param aPoints The points in the first polygon.
-- @param bPoints The points in the second polygon.
-- @param axis The axis (unit sized) to test against.  The points of both polygons
-- will be projected onto this axis.
-- @param response A Response object (optional) which will be populated
-- if the axis is not a separating axis.
-- @returns true if it is a separating axis, false otherwise.  If false,
-- and a response is passed in, information about how much overlap and
-- the direction of the overlap will be populated.
function ____exports.isSeparatingAxis(aPos, bPos, aPoints, bPoints, axis, response)
    local rangeA = table.remove(T_ARRAYS)
    local rangeB = table.remove(T_ARRAYS)
    local offsetV = table.remove(T_VECTORS):copy(bPos):sub(aPos)
    local projectedOffset = offsetV:dot(axis)
    ____exports.flattenPointsOn(aPoints, axis, rangeA)
    ____exports.flattenPointsOn(bPoints, axis, rangeB)
    rangeB[1] = rangeB[1] + projectedOffset
    rangeB[2] = rangeB[2] + projectedOffset
    if rangeA[1] > rangeB[2] or rangeB[1] > rangeA[2] then
        T_VECTORS[#T_VECTORS + 1] = offsetV
        T_ARRAYS[#T_ARRAYS + 1] = rangeA
        T_ARRAYS[#T_ARRAYS + 1] = rangeB
        return true
    end
    if response then
        local overlap = 0
        if rangeA[1] < rangeB[1] then
            response.aInB = false
            if rangeA[2] < rangeB[2] then
                overlap = rangeA[2] - rangeB[1]
                response.bInA = false
            else
                local option1 = rangeA[2] - rangeB[1]
                local option2 = rangeB[2] - rangeA[1]
                overlap = option1 < option2 and option1 or -option2
            end
        else
            response.bInA = false
            if rangeA[2] > rangeB[2] then
                overlap = rangeA[1] - rangeB[2]
                response.aInB = false
            else
                local option1 = rangeA[2] - rangeB[1]
                local option2 = rangeB[2] - rangeA[1]
                overlap = option1 < option2 and option1 or -option2
            end
        end
        local absOverlap = math.abs(overlap)
        if absOverlap < response.overlap then
            response.overlap = absOverlap
            response.overlapN:copy(axis)
            if overlap < 0 then
                response.overlapN:reverse()
            end
        end
    end
    T_VECTORS[#T_VECTORS + 1] = offsetV
    T_ARRAYS[#T_ARRAYS + 1] = rangeA
    T_ARRAYS[#T_ARRAYS + 1] = rangeB
    return false
end
--- Checks whether polygons collide.
-- 
-- @param a The first polygon.
-- @param b The second polygon.
-- @param response Response object (optional) that will be populated if they interset.
-- @returns true if they intersect, false if they don't.
function ____exports.testPolygonPolygon(a, b, response)
    local aPoints = a.calcPoints
    local aLen = #aPoints
    local bPoints = b.calcPoints
    local bLen = #bPoints
    local i
    do
        i = 0
        while i < aLen do
            if ____exports.isSeparatingAxis(
                a.pos,
                b.pos,
                aPoints,
                bPoints,
                a.normals[i + 1],
                response
            ) then
                return false
            end
            i = i + 1
        end
    end
    do
        i = 0
        while i < bLen do
            if ____exports.isSeparatingAxis(
                a.pos,
                b.pos,
                aPoints,
                bPoints,
                b.normals[i + 1],
                response
            ) then
                return false
            end
            i = i + 1
        end
    end
    if response then
        response.a = a
        response.b = b
        response.overlapV:copy(response.overlapN):scale(response.overlap)
    end
    return true
end
--- Represents a vector in two dimensions with `x` and `y` properties.
____exports.Vector = __TS__Class()
local Vector = ____exports.Vector
Vector.name = "Vector"
function Vector.prototype.____constructor(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.x = x
    self.y = y
end
function Vector.prototype.copy(self, other)
    self.x = other.x
    self.y = other.y
    return self
end
function Vector.prototype.clone(self)
    return __TS__New(____exports.Vector, self.x, self.y)
end
function Vector.prototype.perp(self)
    local x = self.x
    self.x = self.y
    self.y = -x
    return self
end
function Vector.prototype.rotate(self, radians)
    local x = self.x
    local y = self.y
    self.x = x * math.cos(radians) - y * math.sin(radians)
    self.y = x * math.sin(radians) + y * math.cos(radians)
    return self
end
function Vector.prototype.reverse(self)
    self.x = -self.x
    self.y = -self.y
    return self
end
function Vector.prototype.normalize(self)
    local d = self:len()
    if d > 0 then
        self.x = self.x / d
        self.y = self.y / d
    end
    return self
end
function Vector.prototype.add(self, other)
    self.x = self.x + other.x
    self.y = self.y + other.y
    return self
end
function Vector.prototype.sub(self, other)
    self.x = self.x - other.x
    self.y = self.y - other.y
    return self
end
function Vector.prototype.scale(self, x, y)
    if y == nil then
        y = x
    end
    self.x = self.x * x
    self.y = self.y * y
    return self
end
function Vector.prototype.project(self, other)
    local amt = self:dot(other) / other:len2()
    self.x = amt * other.x
    self.y = amt * other.y
    return self
end
function Vector.prototype.projectN(self, other)
    local amt = self:dot(other)
    self.x = amt * other.x
    self.y = amt * other.y
    return self
end
function Vector.prototype.reflect(self, axis)
    local x = self.x
    local y = self.y
    self:project(axis):scale(2)
    self.x = self.x - x
    self.y = self.y - y
    return self
end
function Vector.prototype.reflectN(self, axis)
    local x = self.x
    local y = self.y
    self:projectN(axis):scale(2)
    self.x = self.x - x
    self.y = self.y - y
    return self
end
function Vector.prototype.dot(self, other)
    return self.x * other.x + self.y * other.y
end
function Vector.prototype.len2(self)
    return self:dot(self)
end
function Vector.prototype.len(self)
    return math.sqrt(self:len2())
end
--- Represents an axis-aligned box, with a width and height.
____exports.Box = __TS__Class()
local Box = ____exports.Box
Box.name = "Box"
function Box.prototype.____constructor(self, pos, w, h)
    if pos == nil then
        pos = __TS__New(____exports.Vector)
    end
    if w == nil then
        w = 0
    end
    if h == nil then
        h = 0
    end
    self.pos = pos
    self.w = w
    self.h = h
end
function Box.prototype.toPolygon(self)
    local pos = self.pos
    local w = self.w
    local h = self.h
    return __TS__New(
        ____exports.Polygon,
        __TS__New(____exports.Vector, pos.x, pos.y),
        {
            __TS__New(____exports.Vector, 0, 0),
            __TS__New(____exports.Vector, w, 0),
            __TS__New(____exports.Vector, w, h),
            __TS__New(____exports.Vector, 0, h)
        }
    )
end
--- Represents a circle with a position and a radius.
____exports.Circle = __TS__Class()
local Circle = ____exports.Circle
Circle.name = "Circle"
function Circle.prototype.____constructor(self, pos, r)
    if pos == nil then
        pos = __TS__New(____exports.Vector)
    end
    if r == nil then
        r = 0
    end
    self.pos = pos
    self.r = r
    self.offset = __TS__New(____exports.Vector)
end
function Circle.prototype.getAABBAsBox(self)
    local r = self.r
    local corner = self.pos:clone():add(self.offset):sub(__TS__New(____exports.Vector, r, r))
    return __TS__New(____exports.Box, corner, r * 2, r * 2)
end
function Circle.prototype.getAABB(self)
    return self:getAABBAsBox():toPolygon()
end
function Circle.prototype.setOffset(self, offset)
    self.offset = offset
    return self
end
--- Represents a *convex* polygon with any number of points (specified in counter-clockwise order)
-- Note: Do _not_ manually change the `points`, `angle`, or `offset` properties. Use the
-- provided setters. Otherwise the calculated properties will not be updated correctly.
-- `pos` can be changed directly.
____exports.Polygon = __TS__Class()
local Polygon = ____exports.Polygon
Polygon.name = "Polygon"
function Polygon.prototype.____constructor(self, pos, points)
    if pos == nil then
        pos = __TS__New(____exports.Vector)
    end
    if points == nil then
        points = __TS__New(Array)
    end
    self.pos = pos
    self.points = {}
    self.angle = 0
    self.offset = __TS__New(____exports.Vector)
    self.calcPoints = {}
    self.edges = {}
    self.normals = {}
    self:setPoints(points)
end
function Polygon.prototype.setPoints(self, points)
    local lengthChanged = not self.points or #self.points ~= #points
    if lengthChanged then
        local i
        local ____temp_0 = {}
        self.calcPoints = ____temp_0
        local calcPoints = ____temp_0
        local ____temp_1 = {}
        self.edges = ____temp_1
        local edges = ____temp_1
        local ____temp_2 = {}
        self.normals = ____temp_2
        local normals = ____temp_2
        do
            i = 0
            while i < #points do
                do
                    local p1 = points[i + 1]
                    local p2 = i < #points - 1 and points[i + 1 + 1] or points[1]
                    if p1 ~= p2 and p1.x == p2.x and p1.y == p2.y then
                        __TS__ArraySplice(points, i, 1)
                        i = i - 1
                        goto __continue29
                    end
                    calcPoints[#calcPoints + 1] = __TS__New(____exports.Vector)
                    edges[#edges + 1] = __TS__New(____exports.Vector)
                    normals[#normals + 1] = __TS__New(____exports.Vector)
                end
                ::__continue29::
                i = i + 1
            end
        end
    end
    self.points = points
    self:_recalc()
    return self
end
function Polygon.prototype.setAngle(self, radians)
    self.angle = radians
    self:_recalc()
    return self
end
function Polygon.prototype.setOffset(self, offset)
    self.offset = offset
    self:_recalc()
    return self
end
function Polygon.prototype.rotate(self, radians)
    local points = self.points
    local len = #points
    do
        local i = 0
        while i < len do
            points[i + 1]:rotate(radians)
            i = i + 1
        end
    end
    self:_recalc()
    return self
end
function Polygon.prototype.translate(self, x, y)
    local points = self.points
    local len = #points
    do
        local i = 0
        while i < len do
            local ____points_index_3, ____x_4 = points[i + 1], "x"
            ____points_index_3[____x_4] = ____points_index_3[____x_4] + x
            local ____points_index_5, ____y_6 = points[i + 1], "y"
            ____points_index_5[____y_6] = ____points_index_5[____y_6] + y
            i = i + 1
        end
    end
    self:_recalc()
    return self
end
function Polygon.prototype._recalc(self)
    local calcPoints = self.calcPoints
    local edges = self.edges
    local normals = self.normals
    local points = self.points
    local offset = self.offset
    local angle = self.angle
    local len = #points
    local i
    do
        i = 0
        while i < len do
            local calcPoint = calcPoints[i + 1]:copy(points[i + 1])
            calcPoint.x = calcPoint.x + offset.x
            calcPoint.y = calcPoint.y + offset.y
            if angle ~= 0 then
                calcPoint:rotate(angle)
            end
            i = i + 1
        end
    end
    do
        i = 0
        while i < len do
            local p1 = calcPoints[i + 1]
            local p2 = i < len - 1 and calcPoints[i + 1 + 1] or calcPoints[1]
            local e = edges[i + 1]:copy(p2):sub(p1)
            normals[i + 1]:copy(e):perp():normalize()
            i = i + 1
        end
    end
    return self
end
function Polygon.prototype.getAABBAsBox(self)
    local points = self.calcPoints
    local len = #points
    local xMin = points[1].x
    local yMin = points[1].y
    local xMax = points[1].x
    local yMax = points[1].y
    do
        local i = 1
        while i < len do
            local point = points[i + 1]
            if point.x < xMin then
                xMin = point.x
            elseif point.x > xMax then
                xMax = point.x
            end
            if point.y < yMin then
                yMin = point.y
            elseif point.y > yMax then
                yMax = point.y
            end
            i = i + 1
        end
    end
    return __TS__New(
        ____exports.Box,
        self.pos:clone():add(__TS__New(____exports.Vector, xMin, yMin)),
        xMax - xMin,
        yMax - yMin
    )
end
function Polygon.prototype.getAABB(self)
    return self:getAABBAsBox():toPolygon()
end
function Polygon.prototype.getCentroid(self)
    local points = self.calcPoints
    local len = #points
    local cx = 0
    local cy = 0
    local ar = 0
    do
        local i = 0
        while i < len do
            local p1 = points[i + 1]
            local p2 = i == len - 1 and points[1] or points[i + 1 + 1]
            local a = p1.x * p2.y - p2.x * p1.y
            cx = cx + (p1.x + p2.x) * a
            cy = cy + (p1.y + p2.y) * a
            ar = ar + a
            i = i + 1
        end
    end
    ar = ar * 3
    cx = cx / ar
    cy = cy / ar
    return __TS__New(____exports.Vector, cx, cy)
end
--- An object representing the result of an intersection. Contains:
-- - The two objects participating in the intersection
-- - The vector representing the minimum change necessary to extract the first object
--   from the second one (as well as a unit vector in that direction and the magnitude
--   of the overlap)
-- - Whether the first object is entirely inside the second, and vice versa.
____exports.Response = __TS__Class()
local Response = ____exports.Response
Response.name = "Response"
function Response.prototype.____constructor(self)
    self.overlapN = __TS__New(____exports.Vector)
    self.overlapV = __TS__New(____exports.Vector)
    self.overlap = 2 ^ 1024
    self.aInB = true
    self.bInA = true
    self:clear()
end
function Response.prototype.clear(self)
    self.aInB = true
    self.bInA = true
    self.overlap = 2 ^ 1024
    return self
end
T_VECTORS = {}
do
    local i = 0
    while i < 10 do
        T_VECTORS[#T_VECTORS + 1] = __TS__New(____exports.Vector)
        i = i + 1
    end
end
T_ARRAYS = {}
do
    local i = 0
    while i < 5 do
        T_ARRAYS[#T_ARRAYS + 1] = {}
        i = i + 1
    end
end
--- Temporary response used for polygon hit detection.
local T_RESPONSE = __TS__New(____exports.Response)
--- Tiny "point" polygon used for polygon hit detection.
local TEST_POINT = __TS__New(
    ____exports.Box,
    __TS__New(____exports.Vector),
    0.000001,
    0.000001
):toPolygon()
--- Calculates which Voronoi region a point is on a line segment.
-- It is assumed that both the line and the point are relative to `(0,0)`
-- 
--            |       (0)      |
--     (-1)  [S]--------------[E]  (1)
--            |       (0)      |
-- 
-- @param line The line segment.
-- @param point The point.
-- @returns LEFT_VORONOI_REGION (-1) if it is the left region,
-- MIDDLE_VORONOI_REGION (0) if it is the middle region,
-- RIGHT_VORONOI_REGION (1) if it is the right region.
function ____exports.voronoiRegion(line, point)
    local len2 = line:len2()
    local dp = point:dot(line)
    if dp < 0 then
        return -1
    elseif dp > len2 then
        return 1
    else
        return 0
    end
end
--- Check if a point is inside a circle.
-- 
-- @param p The point to test.
-- @param c The circle to test.
-- @returns true if the point is inside the circle, false if it is not.
function ____exports.pointInCircle(p, c)
    local differenceV = table.remove(T_VECTORS):copy(p):sub(c.pos):sub(c.offset)
    local radiusSq = c.r * c.r
    local distanceSq = differenceV:len2()
    T_VECTORS[#T_VECTORS + 1] = differenceV
    return distanceSq <= radiusSq
end
--- Check if a point is inside a convex polygon.
-- 
-- @param p The point to test.
-- @param poly The polygon to test.
-- @returns true if the point is inside the polygon, false if it is not.
function ____exports.pointInPolygon(p, poly)
    TEST_POINT.pos:copy(p)
    T_RESPONSE:clear()
    local result = ____exports.testPolygonPolygon(TEST_POINT, poly, T_RESPONSE)
    if result then
        result = T_RESPONSE.aInB
    end
    return result
end
--- Check if two circles collide.
-- 
-- @param a The first circle.
-- @param b The second circle.
-- @param response Response object (optional) that will be populated if the circles intersect.
-- @returns true if the circles intersect, false if they don't.
function ____exports.testCircleCircle(a, b, response)
    local differenceV = table.remove(T_VECTORS):copy(b.pos):add(b.offset):sub(a.pos):sub(a.offset)
    local totalRadius = a.r + b.r
    local totalRadiusSq = totalRadius * totalRadius
    local distanceSq = differenceV:len2()
    if distanceSq > totalRadiusSq then
        T_VECTORS[#T_VECTORS + 1] = differenceV
        return false
    end
    if response then
        local dist = math.sqrt(distanceSq)
        response.a = a
        response.b = b
        response.overlap = totalRadius - dist
        response.overlapN:copy(differenceV:normalize())
        response.overlapV:copy(differenceV):scale(response.overlap)
        response.aInB = a.r <= b.r and dist <= b.r - a.r
        response.bInA = b.r <= a.r and dist <= a.r - b.r
    end
    T_VECTORS[#T_VECTORS + 1] = differenceV
    return true
end
--- Check if a polygon and a circle collide.
-- 
-- @param polygon The polygon.
-- @param circle The circle.
-- @param response Response object (optional) that will be populated if they interset.
-- @returns true if they intersect, false if they don't.
function ____exports.testPolygonCircle(polygon, circle, response)
    local circlePos = table.remove(T_VECTORS):copy(circle.pos):add(circle.offset):sub(polygon.pos)
    local radius = circle.r
    local radius2 = radius * radius
    local points = polygon.calcPoints
    local len = #points
    local edge = table.remove(T_VECTORS)
    local point = table.remove(T_VECTORS)
    do
        local i = 0
        while i < len do
            local next = i == len - 1 and 0 or i + 1
            local prev = i == 0 and len - 1 or i - 1
            local overlap = 0
            local overlapN = nil
            edge:copy(polygon.edges[i + 1])
            point:copy(circlePos):sub(points[i + 1])
            if response and point:len2() > radius2 then
                response.aInB = false
            end
            local region = ____exports.voronoiRegion(edge, point)
            if region == -1 then
                edge:copy(polygon.edges[prev + 1])
                local point2 = table.remove(T_VECTORS):copy(circlePos):sub(points[prev + 1])
                region = ____exports.voronoiRegion(edge, point2)
                if region == 1 then
                    local dist = point:len()
                    if dist > radius then
                        T_VECTORS[#T_VECTORS + 1] = circlePos
                        T_VECTORS[#T_VECTORS + 1] = edge
                        T_VECTORS[#T_VECTORS + 1] = point
                        T_VECTORS[#T_VECTORS + 1] = point2
                        return false
                    elseif response then
                        response.bInA = false
                        overlapN = point:normalize()
                        overlap = radius - dist
                    end
                end
                T_VECTORS[#T_VECTORS + 1] = point2
            elseif region == 1 then
                edge:copy(polygon.edges[next + 1])
                point:copy(circlePos):sub(points[next + 1])
                region = ____exports.voronoiRegion(edge, point)
                if region == -1 then
                    local dist = point:len()
                    if dist > radius then
                        T_VECTORS[#T_VECTORS + 1] = circlePos
                        T_VECTORS[#T_VECTORS + 1] = edge
                        T_VECTORS[#T_VECTORS + 1] = point
                        return false
                    elseif response then
                        response.bInA = false
                        overlapN = point:normalize()
                        overlap = radius - dist
                    end
                end
            else
                local normal = edge:perp():normalize()
                local dist = point:dot(normal)
                local distAbs = math.abs(dist)
                if dist > 0 and distAbs > radius then
                    T_VECTORS[#T_VECTORS + 1] = circlePos
                    T_VECTORS[#T_VECTORS + 1] = normal
                    T_VECTORS[#T_VECTORS + 1] = point
                    return false
                elseif response then
                    overlapN = normal
                    overlap = radius - dist
                    if dist >= 0 or overlap < 2 * radius then
                        response.bInA = false
                    end
                end
            end
            if overlapN and response and math.abs(overlap) < math.abs(response.overlap) then
                response.overlap = overlap
                response.overlapN:copy(overlapN)
            end
            i = i + 1
        end
    end
    if response then
        response.a = polygon
        response.b = circle
        response.overlapV:copy(response.overlapN):scale(response.overlap)
    end
    T_VECTORS[#T_VECTORS + 1] = circlePos
    T_VECTORS[#T_VECTORS + 1] = edge
    T_VECTORS[#T_VECTORS + 1] = point
    return true
end
--- Check if a circle and a polygon collide.
-- **NOTE:** This is slightly less efficient than polygonCircle as it just
-- runs polygonCircle and reverses everything at the end.
-- 
-- @param circle The circle.
-- @param polygon The polygon.
-- @param response Response object (optional) that will be populated if they interset.
-- @returns true if they intersect, false if they don't.
function ____exports.testCirclePolygon(circle, polygon, response)
    local result = ____exports.testPolygonCircle(polygon, circle, response)
    if result and response then
        local a = response.a
        local aInB = response.aInB
        response.overlapN:reverse()
        response.overlapV:reverse()
        response.a = response.b
        response.b = a
        response.aInB = response.bInA
        response.bInA = aInB
    end
    return result
end
return ____exports
