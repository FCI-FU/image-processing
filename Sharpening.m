function [ New_image ] = Sharpening( Original_image )

% Get image size
[rows,cols,channels]=size(Original_image);
New_image=zeros(rows,cols,channels);
Original_image = double(Original_image);
New_image = double(New_image);
% move over 3 channels
for k = 1:channels
    for i=2:rows-1
        for j=2:cols-1
            New_image(i ,j, k) = 5 * Original_image(i,j,k)-Original_image(i+1,j,k)-Original_image(i-1,j,k)-Original_image(i,j+1,k)-Original_image(i,j-1,k);
        end
    end
end
%Casting image type for show
New_image=uint8(New_image);
Original_image=uint8(Original_image);
%figure,imshow(Original_image),title('blurred Image');
%figure,imshow(New_image),title('Sharped Image');
end


