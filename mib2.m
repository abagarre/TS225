function[Image_final, Mask_final, Box_final] = mib2(Image, Mask, Box, Homographie, Homographie_inverse)


[box_1_x, box_1_y] = transformation(inv(Homographie_inverse), Box(1,1), Box(1,2));
[box_2_x, box_2_y] = transformation(inv(Homographie_inverse), Box(2,1), Box(2,2));
[box_3_x, box_3_y] = transformation(inv(Homographie_inverse), Box(3,1), Box(3,2));
[box_4_x, box_4_y] = transformation(inv(Homographie_inverse), Box(4,1), Box(4,2));
Box_final = [floor(box_1_x) floor(box_1_y); floor(box_2_x), floor(box_2_y); floor(box_3_x), floor(box_3_y); floor(box_4_x), floor(box_4_y)];

Max_x = max([floor(box_1_x) floor(box_2_x) floor(box_3_x) floor(box_4_x)]);
Min_x = min([floor(box_1_x) floor(box_2_x) floor(box_3_x) floor(box_4_x)]);

Max_y = max([floor(box_1_y) floor(box_2_y) floor(box_3_y) floor(box_4_y)]);
Min_y = min([floor(box_1_y) floor(box_2_y) floor(box_3_y) floor(box_4_y)]);

Image_final = zeros(Max_x-Min_x+1,Max_y-Min_y+1);
Mask_final = Image_final;

[W,H] = size(Image_final);

for i = 1:W+1
    for j = 1:H+1
        [x, y] = transformation(Homographie_inverse, i+Min_x-1, j+Min_y-1);
        if contiens([1 Box(3,1) Box(3,1) 1 1 1 Box(3,2) Box(3,2)], x, y)
			Image_final(i,j) = Image(x,y);
            Mask_final(i,j) = 1;
        end
    end
end

% Image_final = Image_final(~all(Image_final == 0, 2),:);
% Image_final = Image_final(:,~all(Image_final == 0, 1));

end
