function [ New_image ] = Unsharp( sharped_image,blurres_image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[rows,cols,channels]=size(blurres_image);
New_image=zeros(rows,cols,channels);

for k=1:channels
    for i=1:(rows)
        for j=1:(cols)
            New_image(i, j, k) = sharped_image(i, j, k)-blurres_image(i, j, k);
        end
    end
end
New_image=uint8(New_image);
%figure,imshow(New_image),title('Unsharp Image');
end

