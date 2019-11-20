function [x2, y2] = transformation(H, x1, y1)

M2 = H*[x1;y1;1];

x2 = floor(M2(1)/M2(3));
y2 = floor(M2(2)/M2(3));