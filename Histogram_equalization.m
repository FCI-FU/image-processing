function newImage = Histogram_equalization(Original_image)
[rows,cols,channels] = size(Original_image);
freq = zeros(256);
for k=1:channels
    for x=1:rows
        for y=1:cols
            freq(Original_image(x,y,k)+1) = freq(Original_image(x,y,k)+1) + 1;
        end
    end
end
for i=2:256
    freq(i) = freq(i) + freq(i-1);
end
MAX = freq(256);
for i=1:256
    freq(i) = round(double(freq(i) / MAX) * double(256));
end
for k=1:channels
    for x=1:rows
        for y=1:cols
            Original_image(x,y,k) = freq(Original_image(x,y,k)+1);
        end
    end
end
newImage = Original_image;
end