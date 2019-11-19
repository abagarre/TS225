clear ; clc ; close all ;

IMG1 = double(imread("../../images/lena.bmp"));
IMG2 = double(imread("../../images/lena.bmp"));

[h, w] = size(IMG2);

[H, Q] = homographie(IMG1, IMG2);

for x=1:w
	for y=1:h
		[x2, y2] = projection(H, x, y);
		if contiens(Q, x2, y2) == 1
			IMG2(y,x) = IMG1(y2,x2);
		end
	end
end

figure, imagesc(IMG2), colormap(gray);