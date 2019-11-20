function [IMG] = projection(Q, R, H, IMG, IMG2)

XA = floor(Q(:,1));
YA = floor(Q(:,2));
for x=min(XA):max(XA)
	for y=min(YA):max(YA)
		[x2, y2] = transformation(H, x, y);
		if contiens(R, x2, y2)
			IMG(y,x) = IMG2(y2,x2);
		end
	end
end

end

