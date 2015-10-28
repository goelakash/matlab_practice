
function [res] = deriv_y(image,height,width)

I = mat2gray(image);
res = zeros(height-1,width-1);

for i=1:height-1
    for j=1:width-1
        res(i,j) = (I(i,j+1)-I(i,j)+1)/2.0;
    end
end

