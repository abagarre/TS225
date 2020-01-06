function[Image, Mask, Box] = mib(Image)

[h,w] = size(Image);
Mask = ones(h,w);
Box = [1 1; h w];
end
