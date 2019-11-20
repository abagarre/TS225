function [IMG2] = extraction(H, IMG1, IMG2)

[h, w] = size(IMG2);

for x=1:w
	for y=1:h
		[x2, y2] = transformation(inv(H), x, y);
		IMG2(y,x) = IMG1(y2,x2);
	end
end

end

