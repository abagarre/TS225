function [bool] = contiens(Q, x2, y2)

xmin = Q(1);
xmax = Q(2);
ymin = Q(5);
ymax = Q(7);

if (x2 >= xmin && x2 <= xmax && y2 >= ymin && y2 <= ymax)
	bool = 1;
else
	bool = 0;
end