function[Image_final, Mask_final, Box_final] = mib2(Image, Mask, Box, Homographie)

[box_1_x, box_1_y] = transformation(inv(Homographie), Box(1,1), Box(1,2));
[box_2_x, box_2_y] = transformation(inv(Homographie), Box(1,1), Box(2,2));
[box_3_x, box_3_y] = transformation(inv(Homographie), Box(2,1), Box(1,2));
[box_4_x, box_4_y] = transformation(inv(Homographie), Box(2,1), Box(2,2));


Max_x = max([(box_1_x) (box_2_x) (box_3_x) (box_4_x)]);
Min_x = min([(box_1_x) (box_2_x) (box_3_x) (box_4_x)]);

Max_y = max([(box_1_y) (box_2_y) (box_3_y) (box_4_y)]);
Min_y = min([(box_1_y) (box_2_y) (box_3_y) (box_4_y)]);

Box_final = [Min_x Min_y;Max_x Max_y];

Image_final = zeros(Max_x-Min_x+1,Max_y-Min_y+1);
Mask_final = Image_final;

[H,W] = size(Image_final);

for i = 1:H
    for j = 1:W
        [x, y] = transformation(Homographie, i+Min_x-1, j+Min_y-1);
        if contiens(Box(1,1), Box(2,1), Box(1,2), Box(2,2), x, y)
			Image_final(i,j) = Image(x,y);
            Mask_final(i,j) = 1;
        end
    end
end

% Image_final = Image_final(~all(Image_final == 0, 2),:);
% Image_final = Image_final(:,~all(Image_final == 0, 1));

end
