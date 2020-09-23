function powered_image = powered(Original_image,gamma)
[rows,cols,channels] = size(Original_image);
powered_image = zeros(rows,cols,channels);

for k=1:channels
    for x=1:rows
        for y=1:cols
            powered_image(x,y,k) = power(Original_image(x,y,k),gamma);
        end
    end
end
Contrast(powered_image,255,0);
