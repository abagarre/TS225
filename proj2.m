% 2*4 pts en commun sur images
% calcule homographie H
% projection image entiere pour avoir le cadre (attention sens)
% fusion des 2 images dans cadre + grand
% masque : pour faire moyennage des images (nombre de pixels communs)
% 

clear ; clc ; close all ;

IMG1 = double(imread("images/monument.bmp"));
IMG2 = double(imread("images/monument2.bmp"));

MIB1 = mib(IMG1);
MIB2 = mib(IMG2);

figure(1), imagesc(IMG1), colormap(gray);
[XA, YA] = ginput(4);
Q = [XA YA];
close(1);

figure(2), imagesc(IMG2), colormap(gray);
[XB, YB] = ginput(4);
R = [XB YB];
close(2);

%% PROJECTION
H1 = homographie(XA, YA, XB, YB);
H2 = homographie(XB, YB, XA, YA);

MIB3 = mib_homographie(MIB2, H1, H2);

figure, imagesc(MIB3.image), colormap(gray);
