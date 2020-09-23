function New_image = Grayscale(Original_image)
[rows,cols,channels] = size(Original_image);
New_image = zeros(rows,cols,1);
for x=1:rows
    for y=1:cols
        New_image(x,y,1) = 0.3*Original_image(x,y,1) + 0.59*Original_image(x,y,min(2,channels)) + 0.11*Original_image(x,y,min(3,channels));
    end
end
New_image=uint8(New_image);

end