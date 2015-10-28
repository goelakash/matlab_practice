%mean filter

function [mean] = mean_filter(image,height,width,kernel)

I = mat2gray(image);

ks = floor(kernel/2);

length = (ks*2+1)*(ks*2+1);
mean = zeros(size(I));

for i=ks+1:height-ks
    for j = ks+1:width-ks
        % Kernel of 3x3 for ks=1         
        for x=i-ks:i+ks
            for y=j-ks:j+ks

                mean(i,j) = mean(i,j)+I(x,y);
            
            end
        end
        mean(i,j)=mean(i,j)/length;
    end
end
