function[Image, Mask, Box] = fusion(Image1, Mask1, Box1, Image2, Mask2, Box2)

Box = zeros(2,2);

Min_y = min([min(Box1(:,1)) min(Box2(:,1))]);
Max_y = max([max(Box1(:,1)) max(Box2(:,1))]);
Min_x = min([min(Box1(:,2)) min(Box2(:,2))]);
Max_x = max([max(Box1(:,2)) max(Box2(:,2))]);


[w1,h1] = size(Image1);
[w2,h2] = size(Image2);

%%
C_x1 = min(Box2(:,2))-Min_x+1:min(Box2(:,2))-Min_x+w1;
C_y1 = min(Box2(:,1))-Min_y+1:min(Box2(:,1))-Min_y+h1;

C_x2 = min(Box1(:,2))-Min_x+1+h1-h2:min(Box1(:,2))-Min_x+w2+h1-h2;
C_y2 = min(Box1(:,1))-Min_y+1+w1-w2:min(Box1(:,1))-Min_y+h2+w1-w2;

Box(1,1) = Min_x;
Box(1,2) = Min_y;
Box(2,1) = Max_x;
Box(2,2) = Max_y;

Image = zeros(max(max(C_x1),max(C_x2)), max(max(C_y1),max(C_y2)));
Mask = Image;

%%
Mask(C_x1, C_y1) = Mask1;
Mask(C_x2, C_y2) = Mask(C_x2, C_y2) + Mask2;

Image(C_x1, C_y1) = Image1;
Image(C_x2, C_y2) = Image2;

% figure, imagesc(Image), colormap(gray);


end
