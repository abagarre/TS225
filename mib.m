function[Image, Mask, Box] = mib(Image)

[w,h] = size(Image);
Mask = ones(w,h);
Box = [1 1; w h];
end
