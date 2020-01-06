function [bool] = contiens(xmin, xmax, ymin, ymax, x2, y2)


if (x2 >= xmin && x2 <= xmax && y2 >= ymin && y2 <= ymax)
	bool = 1;
else
	bool = 0;
end