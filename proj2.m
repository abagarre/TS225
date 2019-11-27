% 2*4 pts en commun sur images
% calcule homographie H
% projection image entiere pour avoir le cadre (attention sens)
% fusion des 2 images dans cadre + grand
% masque : pour faire moyennage des images (nombre de pixels communs)
% 

clear ; clc ; close all ;

IMG1 = double(imread("../../images/monument.bmp"));
IMG2 = double(imread("../../images/monument2.bmp"));
[h1, w1] = size(IMG1);
[h2, w2] = size(IMG2);

IMG3 = IMG2.*0;
[h3, w3] = size(IMG3);

figure(1), imagesc(IMG1), colormap(gray);
[XA, YA] = ginput(4);
Q = [XA YA];
close(1);

figure(2), imagesc(IMG2), colormap(gray);
[XB, YB] = ginput(4);
R = [XB YB];
close(2);

Coor_IMG1 = [1 1; w1 1; w1 h1; 1 h1];
Coor_IMG3 = [1 1; w3 1; w3 h3; 1 h3];

%% PROJECTION
H1 = homographie(XA, YA, XB, YB);
IMG4 = projection(Coor_IMG3, Coor_IMG1, H1, IMG3, IMG2);
figure, imagesc(IMG4), colormap(gray);
