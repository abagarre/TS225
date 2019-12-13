function[Image, Mask, Box] = fusion(Image1, Mask1, Box1, Image2, Mask2, Box2)
Box = zeros(2,2);
Box(1,1) = min(Box1(1,1),Box2(1,1));
Box(1,2) = min(Box1(1,2),Box2(1,2));
Box(2,1) = max(Box1(2,1),Box2(2,1));
Box(2,2) = max(Box1(2,2),Box2(2,2));

if(Box(1,1) < 1)
    while(Box(1,1) < 1)
        Box(1,1) = Box(1,1)+1;
        Box1(1,1) = Box1(1,1)+1;
        Box2(1,1) = Box2(1,1)+1;
    end
end

if(Box(1,2) < 1)
    while(Box(1,2) < 1)
        Box(1,2) = Box(1,2)+1;
        Box1(1,2) = Box1(1,2)+1;
        Box2(1,2) = Box2(1,2)+1;
    end
end

% IMG = ones(Box(2,1),Box(2,2));
% 
% [Image] = projection(IMG, R, H, IMG1, IMG2);





Image = ones(Box(2,1),Box(2,2));
Mask = zeros(Box(2,1),Box(2,2));

for i = Box1(1,1):Box1(2,1)
    for j = Box1(1,2):Box1(2,2)
        Image(i,j) = Image1(i,j);
    end
end

for i = Box2(1,1):Box2(2,1)
    for j = Box2(1,2):Box2(2,2)
        Image(i,j) = Image2(i,j);
    end
end



end
