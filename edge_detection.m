function [ New_image ] = edge_detection( Original_image )

% Get image size
figure,imshow(Original_image),title('Original Image');
Original_image = im2bw(Original_image, 0.65);
[rows,cols,channels]=size(Original_image);
New_image=zeros(rows,cols,channels);
Original_image = double(Original_image);
New_image = double(New_image);
% move over 3 channels
for i=2:rows-1
    for j=2:cols-1
        New_image(i ,j) = -4*Original_image(i ,j)+Original_image(i-1 ,j)+Original_image(i+1 ,j)+Original_image(i ,j+1)+Original_image(i ,j-1);         
    end
end
%Casting image type for show
New_image=uint8(New_image);
New_image = Contrast(New_image, 255, 0);
%figure,imshow(New_image),title('New Image');
end

