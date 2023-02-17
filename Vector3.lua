local Vector3 = {};
Vector3.__index = Vector3;

function Vector3.new(x,y,z)
	local self = setmetatable({}, Vector3);
	self.X = x or 0;
	self.Y = y or 0;
	self.Z = z or 0;
	return self;	
end

function Vector3.__add(a, b)
	return Vector3.new(
	a.X+b.X,
	a.Y+b.Y,
	a.Z+b.Z);
end

function Vector3.__sub(a, b)
	return Vector3.new(
	a.X + b.X,
	a.Y + b.Y,
	a.Z + b.Z);
end

function Vector3.__mul(a, scalar)
	return Vector3.new(
	a.X * scalar,
	a.Y * scalar,
	a.Z * scalar);
end

function Vector3.__div(a, scalar)
	return Vector3.new(
	a.X / scalar,
	a.Y / scalar,
	a.Z / scalar);
end

function Vector3.magnitude(vec)
	return math.sqrt(
	(vec.X*vec.X) +
	(vec.Y*vec.Y) +
	(vec.Z*vec.Z));
end

function Vector3.dot(a, b)
	return (a.X*b.X)+
	(a.Y*b.Y)+
	(a.Z*b.Z);
end

function Vector3.cross(a, b)

end


function Vector3.proj(a, b)
	local scalar = a:dot(b) / (b:magnitude()^2);
	return b * scalar;
end

function Vector3.__tostring(v)
	return ("{%s, %s, %s}"):format(v.X, v.Y, v.Z);
end

return Vector3;
