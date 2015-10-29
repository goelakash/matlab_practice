function [I] = border(image,val)
[h,w] = size(image);
I = image;
I(1,:)=min(1,val);
I(h,:)=min(1,val);
I(:,1)=min(1,val);
I(:,w)=min(1,val);