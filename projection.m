function [IMG1] = projection(Q, R, H, IMG1, IMG2)

XA = floor(Q(:,1));
YA = floor(Q(:,2));
for x=min(XA):max(XA)
	for y=min(YA):max(YA)
		[x2, y2] = transformation(H, x, y);
		if contiens(min(R(1:4)), max(R(1:4)), min(R(5:8)), max(R(5:8)), x2, y2)
			IMG1(y,x) = IMG2(y2,x2);
		end
	end
end

end

