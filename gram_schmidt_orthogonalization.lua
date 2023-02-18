local Vector2 = require("Vector2")
local Vector3 = require("Vector3")

-- TODO: Develop a set class for notational convenience;

--- @type table<T, K> {[T]:K}
--- @type array<T> table<int, T>
--- @param set_of_vectors array<Vector2>
-- Returns array<Vector2>
local function orthogonalize(set_of_vectors)
	local vectors_prime = {};
	vectors_prime[1] = set_of_vectors[1]

	for i = 2, #set_of_vectors do
		local orig = set_of_vectors[i];
		for k = 1, i-1 do
			orig = orig - set_of_vectors[i]:proj(vectors_prime[k]);
		end
		vectors_prime[i] = orig;

	end
	return vectors_prime;
end

-- Challenge:
-- Orthogonalize the following set of vectors
-- <sqrt(pi)/2, sqrt(pi)/2, 0>
-- <-1, 1, -1>
-- <0, -2, -2>

local result = orthogonalize(
{
Vector3.new(math.sqrt(2)/2, math.sqrt(2)/2, 0), 
Vector3.new(-1, 1, -1),
Vector3.new(0, -2, -2)})

for k, v in ipairs(result) do
	print(v)
end


local Matrix = require("Matrix")

local M = Matrix.new(
{{0, 2},
 {2, 5}});

print(M:determinant());
