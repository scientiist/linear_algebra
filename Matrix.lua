-- Arbitrary n x m Matrix implementation

local Matrix = {};
Matrix.__index;


function Matrix.new(elems)
	local self = setmetatable({}, Matrix);
	self.Elements = elems or {}
	-- TODO: determine matrix w x h
	return self;
end

function Matrix.empty(width, height)
	local self = Matrix.new();
	for row = 1, width do
		self.Elements[row] = {};
		for col = 1, height do
			self.Elements[row][col] = 0.0
		end
	end
	self.Width = width;
	self.Height = height;
	return self;
end

function Matrix.scalarMult(mat, scalar)
	local new = Matrix.empty(mat.Width, mat.Height);
	for x = 1, mat.Width do
		for y = 1, mat.Height do
			new.Elements[x][y] = mat.Elements[x][y] * scalar
		end
	end
	return new;
end

function Matrix.matrixMult(mat1, mat2)
	local width = mat1.Width;
	local height = mat2.Height;
	local newMat = Matrix.empty(width, height);
	
	for i = 1, width do
		for j = 1, height do
			local newIndex = 0;
			for k = 1, mat1.Height do
				newIndex = newIndex + mat1.Elements[i][k]*mat2.Elements[k][j];
			end
			newMat.Elements[i][j] = newIndex;
		end
	end
	return newMat;
end

function Matrix.__mul(mat, unknown)
	if type(unknown)=="number" then
		return Matrix.scalarMult(mat, unknown);
	else
		return Matrix.matrixMult(mat, unknown);
	end
	
end

function Matrix.__div(mat, unknown)
	if type(unknown)=="number" then
		
	else

	end
	local new = Matrix.empty(mat.Width, mat.Height);
end

function Matrix.__add(m1, m2)
	local minW = math.min(m1.Width, m2.Width);
	local minH = math.min(m1.Height, m2.Height);
	local new = Matrix.empty(minW, minH);
	for x = 1, minW do
		for y = 1, minH do
			new.Elements[x][y] = m1.Elements[x][y] + m2.Elements[x][y];
		end
	end
	return new;
end

function Matrix.__sub(m1, m2)
	local minW = math.min(m1.Width, m2.Width);
	local minH = math.min(m1.Height, m2.Height);
	local new = Matrix.empty(minW, minH);

	for x = 1, minW do
		for y = 1, minH do
			new.Elements[x][y] = m1.Elements[x][y] + m2.Elements[x][y];
		end
	end
	return new;
end





return Matrix;

