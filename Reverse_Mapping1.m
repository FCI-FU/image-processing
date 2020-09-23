function Resized_image = Reverse_Mapping1(Original_image,factor1,factor2)
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
            x1 = floor(oldX);
            y1 = floor(oldY);
            if(x1 < 1)
                x1 = 1;
            end
            if(y1 < 1)
                y1 = 1;
            end
            x2 = x1 +1;
            y2 = y1 +1;
            if(x2 > rows)
                x2 = rows;
            end
            if(y2 > cols)
                y2 = cols;
            end
            p1 = Original_image(x1,y1,k);
            p2 = Original_image(x2,y1,k);
            p3 = Original_image(x1,y2,k);
            p4 = Original_image(x2,y2,k);
            xf = oldX - x1;
            yf = oldY - y1;
            z1 = p1 * (1-xf) + p2 * xf;
            z2 = p3 * (1-xf) + p4 * xf;
            new = z1 * (1-yf) + z2*yf;
            Resized_image(x,y,k) = floor(new);
        end
    end
end
%Casting image type for show
Resized_image=uint8(Resized_image);
figure,imshow(Original_image),title('Original Image');
figure,imshow(Resized_image),title('Resized Image');
end