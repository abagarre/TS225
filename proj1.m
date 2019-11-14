clear ; clc ; close all ;

IMG1 = double(imread("../images/monument.bmp"));
IMG2 = double(imread("../images/monument.bmp"));

[w,h] = size(IMG2);

[H, XA, YA, XB, YB] = homographie(IMG1, IMG2);

