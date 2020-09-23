    function newImage = Histogram_matching(Original_image,Original_image1)
[rows,cols,channels] = size(Original_image);
freq = zeros(256);
freq1 = zeros(256);
for k=1:channels
    for x=1:rows
        for y=1:cols
            freq(Original_image(x,y,k)+1) = freq(Original_image(x,y,k)+1) + 1;
            freq1(Original_image1(x,y,k)+1) = freq1(Original_image1(x,y,k)+1) + 1;
        end
    end
end
for i=2:256
    freq(i) = freq(i) + freq(i-1);
    freq1(i) = freq1(i) + freq1(i-1);
end
MAX = freq(256);
MAX1 = freq1(256);
for i=1:256
    freq(i) = round(double(freq(i) / MAX) * double(256));
    freq1(i) = round(double(freq1(i) / MAX1) * double(256));
end

for i=1:256
    def = 256;
    for j=1:256
        if(abs(freq(i) - freq1(j)) < def)
            def = abs(freq(i) - freq1(j));
            index = j;
        end
    end
    freq(i) = index - 1;
end
for k=1:channels
    for x=1:rows
        for y=1:cols
            Original_image(x,y,k) = freq(Original_image(x,y,k)+1);
        end
    end
end
%figure,imshow(Original_image),title('matched Image');
%figure,imshow(Original_image1),title('Original Image');
newImage = Original_image;
end