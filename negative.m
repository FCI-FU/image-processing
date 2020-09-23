function negative_image = negative(Original_image)
[rows,cols,channels] = size(Original_image);
negative_image = zeros(rows,cols,channels);

for k=1:channels
    for x=1:rows
        for y=1:cols
            negative_image(x,y,k) = 255 - Original_image(x,y,k);
        end
    end
end

negative_image=uint8(negative_image);
%figure,imshow(negative_image),title('negative Image');