clear ; clc ; close all ;

IMG1 = double(imread("../../images/monument.bmp"));
IMG2 = double(imread("../../images/lena.bmp"));
IMG3 = img_rectangle(500,500,0);

[h1, w1] = size(IMG1);
[h2, w2] = size(IMG2);
[h3, w3] = size(IMG3);


figure(1), imagesc(IMG1), colormap(gray);
[XA, YA] = ginput(4);
hold on;
plot([XA;XA(1)],[YA;YA(1)], 'r');
Q = [XA YA];


XB = [1 w2 w2 1];
YB = [1 1 h2 h2];
R = [XB YB];

XC = [1 w3 w3 1];
YC = [1 1 h3 h3];

%% PROJECTION
H1 = homographie(XA, YA, XB, YB);
IMG4 = projection(Q, R, H1, IMG1, IMG2);
figure(2), imagesc(IMG4), colormap(gray);

%% EXTRACTION
H2 = homographie(XA, YA, XC, YC);
IMG5 = extraction(H2, IMG1, IMG3);
figure(3), imagesc(IMG5), colormap(gray);