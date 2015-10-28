
function [res] = deriv_x(image,height,width)

I = mat2gray(image);
res = zeros(height-1,width-1);

for i=1:height-1
    for j=1:width-1
        res(i,j) = (I(i+1,j)-I(i,j)+1)/2.0;
    end
end

