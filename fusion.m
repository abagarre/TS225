function[Image, Mask, Box] = fusion(Image1, Mask1, Box1, Image2, Mask2, Box2)
Box = zeros(4,2);

Min_x = min([min(Box1(:,1)) min(Box2(:,1))])
Max_x = max([max(Box1(:,1)) max(Box2(:,1))])
Min_y = min([min(Box1(:,2)) min(Box2(:,2))])
Max_y = max([max(Box1(:,1)) max(Box2(:,2))])

Box(1,1) = Min_x;
Box(1,2) = Min_y;
Box(2,1) = Min_x;
Box(2,2) = Max_y;
Box(3,1) = Max_x;
Box(3,2) = Max_y;
Box(4,1) = Max_x;
Box(4,2) = Min_y;


Image = zeros(Max_x-Min_x,Max_y-Min_y);
Mask = Image;

for i = min(Box1(:,1))+1:max(Box1(:,1))
    for j = min(Box1(:,2))+1:max(Box1(:,2))
        Mask(i-Min_x,j-Min_y) = Mask(i-Min_x,j-Min_y)+1;
    end
end

for i = min(Box2(:,1))+1:max(Box2(:,1))
    for j = min(Box2(:,2))+1:max(Box2(:,2))
        Mask(i-Min_x,j-Min_y) = Mask(i-Min_x,j-Min_y)+1;
    end
end

% 
% Image = ones(max([Box(1,1) Box(2,1) Box(3,1) Box(4,1)]),max([Box(1,2) Box(2,2) Box(3,2) Box(4,2)]));
% %Mask = zeros(Box(2,1),Box(2,2));
% 
% for i = Box1(1,1):Box1(2,1)
%     for j = Box1(1,2):Box1(2,2)
%         Image1(i,j)
%         Image(i,j) = Image1(i,j);
%     end
% end
% 
% % for i = Box2(1,1):Box2(2,1)
% %     for j = Box2(1,2):Box2(2,2)
% %         Image(i,j) = Image2(i,j);
% %     end
% end



end
