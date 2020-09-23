function Histogram(Original_image)
[rows,cols,channels] = size(Original_image);
freq = zeros(256);
for k=1:channels
    for x=1:rows
        for y=1:cols
            freq(Original_image(x,y,k)+1) = freq(Original_image(x,y,k)+1) + 1;
        end
    end
end
figure,hist(freq ,[1:10:256]);
end