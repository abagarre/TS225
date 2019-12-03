function[Image1, Mask1, Box1] = mib2(Image, Mask, Box, Homographie)
% [box_top_x, box_top_y] = transformation(Homographie, Box(1,1), Box(1,2));
% [box_down_x, box_down_y] = transformation(Homographie, Box(2,1), Box(2,2));
% Box1 = [floor(box_top_x) floor(box_top_y); floor(box_down_x), floor(box_down_y)];


[w,h] = size(Image);

Test1 = ones(w,h);
Test2 = ones(w,h);

for i = 1:w
    for j = 1:h
        [x, y] = transformation(Homographie, i, j);
        Test1(i,j) = x;
        Test2(i,j) = y;
    end
end



Max_x = max(max(Test1));
Min_x = min(min(Test1));

Max_y = max(max(Test2));
Min_y = min(min(Test2));

Box1 = [1 1; floor(Max_x-Min_x)+1, floor(Max_y-Min_y)+1];

Image1 = zeros(Max_x-Min_x,Max_y-Min_y);
Mask1 = Image1;

for i = 1:w
    for j = 1:h
        Image1(floor(Test1(i,j)-Min_x+1),floor(Test2(i,j)-Min_y+1)) = Image(i,j);
        Mask1(Test1(i,j)-Min_x+1,Test2(i,j)-Min_y+1) = Mask(i,j);
    end
end

end
