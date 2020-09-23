function Brightness_image = Brightness(Original_image,OFFSET)
[rows,cols,channels] = size(Original_image);
Brightness_image = zeros(rows,cols,channels);

for k=1:channels
    for x=1:rows
        for y=1:cols
            Brightness_image(x,y,k) = Original_image(x,y,k) + OFFSET ;
            if(Brightness_image(x,y,k) < 0)
                Brightness_image(x,y,k) = 0;
            elseif(Brightness_image(x,y,k)>255)
                Brightness_image(x,y,k) = 255;
            end
        end
    end
end

Brightness_image=uint8(Brightness_image);