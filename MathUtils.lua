local MathUtils = {}

MathUtils.Clamp = function(Value : number, Min : number, Max : number)
	return math.max(Min, math.min(Max, Value))
end

MathUtils.Distance = function(Pos1 : Vector3, Pos2 : Vector3)
	return (Pos1 - Pos2).Magnitude
end

MathUtils.RangeRandom = function(Max, Min)
	return math.random() * (Max - Min) + Min
end

MathUtils.VectorNormalize = function(Vector : Vector3)
	return Vector.Unit
end

MathUtils.VectorDot = function(vector1 : Vector3, vector2 : Vector3)
	return vector1:Dot(vector2)
end

MathUtils.VectorAngleBetween = function(vector1 : Vector3, vector2 : Vector3)
	return math.acos(vector1:Dot(vector2) / (vector1.Magnitude * vector2.Magnitude))
end

MathUtils.Round = function(num, Type : "Ceil" | "Floor" | "Round")
	if Type == "Ceil" then
		return math.ceil(num)
	elseif Type == "Floor" then
		return math.floor(num)
	elseif Type == "Round" then
		return math.round(num)
	end
end

MathUtils.Avrg = function(...)
	local args = {...}
	local total = 0
	for _, num in ipairs(args) do
		total += num
	end
	return total/#args
end

MathUtils.Sing = function(value : number)
	if value > 0 then
		return 1
	elseif value < 0 then
		return -1
	elseif value == 0 then
		return 0
	end
end

MathUtils.ToDeg = function(valueDeg)
	return valueDeg * (180/math.pi)
end

MathUtils.ToRad = function(valueRad)
	return valueRad * (math.pi/180)
end

MathUtils.PNoise = function(xVal, yVal, zVal)
	return math.noise(xVal, yVal, zVal)
end

MathUtils.VectorCrossProduct = function(v1 : Vector3, v2 : Vector3)
	return Vector3.new(
		v1.Y * v2.Z - v1.Z * v2.Y,
		v1.Z * v2.X - v1.X * v2.Z,
		v1.X * v2.Y - v1.Y * v2.X
	)
end

MathUtils.VectorAngle = function(v1 : Vector3, v2 : Vector3)
	local dotP = v1:Dot(v2)
	local magnitudeP = v1.Magnitude * v2.Magnitude
	return math.deg(math.acos(MathUtils.Clamp(dotP / magnitudeP, -1, -1)))
end

return MathUtils
