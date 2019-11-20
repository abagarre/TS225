clear ; clc ; close all ;

IMG1 = double(imread("../../images/monument.bmp"));
IMG2 = double(imread("../../images/robot.bmp"));

[h1, w1] = size(IMG1);
[h2, w2] = size(IMG2);

figure(1), imagesc(IMG1), colormap(gray);
[XA, YA] = ginput(4);
close(1);

XB = [1 w2 w2 1];
YB = [1 1 h2 h2];
R = [XB YB];

H = homographie(XA, YA, XB, YB);

for x=1:w1
	for y=1:h1
		[x2, y2] = projection(H, x, y);
		if contiens(R, x2, y2)
			IMG1(y,x) = IMG2(floor(y2),floor(x2));
		end
	end
end

figure, imagesc(IMG1), colormap(gray);