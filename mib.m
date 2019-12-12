classdef mib
    %MIB Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        image
        masque
        be
    end
    
    methods
        function obj = mib(image)
            [h1, w1] = size(image);
            obj.image = image;
            obj.masque = image.*0 + 1;
            obj.be = [1 1; w1 h1];
        end
    end
end
