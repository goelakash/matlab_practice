function [I] = deriv(image)
[h,w] = size(mat2gray(image));
I = zeros(h,w);

kern = [1 1 1; 1 -8 1; 1 1 1]

for i=2:h-1
    for j=2:w-1
        for y=-1:1
            for x=-1:1
                I(i,j) = I(i,j) + image(i+y,j+x)*kern(y+2,x+2);
            end
        end
    end
end


                