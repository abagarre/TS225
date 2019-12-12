function [MIB2] = mib_homographie(MIB1, H, H_inv)

Xmin = min(MIB1.be(:,1));
Xmax = max(MIB1.be(:,1));
Ymin = min(MIB1.be(:,2));
Ymax = max(MIB1.be(:,2));


[be_t1x, be_t1y] = transformation(H_inv, Xmin, Ymin);
[be_t2x, be_t2y] = transformation(H_inv, Xmax, Ymax);
[be_t3x, be_t3y] = transformation(H_inv, Xmin, Ymax);
[be_t4x, be_t4y] = transformation(H_inv, Xmax, Ymin);

Y = [be_t1x be_t2x be_t3x be_t4x];
X = [be_t1y be_t2y be_t3y be_t4y];

image2  = zeros(max(Y)-min(Y)+1,max(X)-min(X)+1);
[h2, w2] = size(image2);
masque2 = zeros(max(Y)-min(Y)+1,max(X)-min(X)+1);

for x = 1:h2
    for y = 1:w2
        [x2, y2] = transformation(H,x-min(X)+1,y-min(Y)+1);
        if (x2 >= Xmin && x2 <= Xmax && y2 >= Ymin && y2 <= Ymax)
            image2(y,x) = MIB1.image(y2,x2);
        end
    end
    
end

% masque2(masque2 ~= 1) = 0;

MIB2.image = image2;
MIB2.masque = masque2;

end

