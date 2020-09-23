function contrasted_image = Contrast(Original_image,NewMax,NewMin)
[rows,cols,channels] = size(Original_image);
oldMax = 0;
oldMin = 255;
contrasted_image = zeros(rows,cols,channels);
for k=1:channels
    for x=1:rows
        for y=1:cols
            if(Original_image(x,y,k) < oldMin)
                oldMin = Original_image(x,y,k);
            end
            if(Original_image(x,y,k) > oldMax)
                oldMax = Original_image(x,y,k);
            end
        end
    end
end

for k=1:channels
    for x=1:rows
        for y=1:cols
            contrasted_image(x,y,k) = double(double(Original_image(x,y,k) - oldMin) / double(oldMax-oldMin)) * double(NewMax - NewMin) + double(NewMin) ;
            if(contrasted_image(x,y,k) < 0)
                contrasted_image(x,y,k) = 0;
            elseif(contrasted_image(x,y,k)>255)
                contrasted_image(x,y,k) = 255;
            end
        end
    end
end
contrasted_image=uint8(contrasted_image);
