function [bool] = contiens(R, x2, y2)

xmin = R(1);
xmax = R(2);
ymin = R(5);
ymax = R(7);

if (x2 >= xmin && x2 <= xmax && y2 >= ymin && y2 <= ymax)
	bool = 1;
else
	bool = 0;
end