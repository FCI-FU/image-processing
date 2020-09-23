function Resized_image = Reverse_Mapping(Original_image,factor1,factor2)
% Get image size
[rows,cols,channels] = size(Original_image);
Resized_image = zeros(rows*factor1,cols*factor2,channels);
% move over 3 channels
rowRatio = 1/factor1;
colRatio = 1/factor2;

for k=1:channels
    for x=1:rows*factor1
        for y=1:cols*factor2
            oldX = round(x * rowRatio);
            oldY = round(y * colRatio);
            if(oldX < 1)
                oldX = 1;
            end
            if(oldY < 1)
                oldY = 1;
            end
            Resized_image(x,y,k) = Original_image(oldX,oldY,k);
        end
    end
end
%Casting image type for show
Resized_image=uint8(Resized_image);
%figure,imshow(Original_image),title('Original Image');
%figure,imshow(Resized_image),title('Resized Image');
end