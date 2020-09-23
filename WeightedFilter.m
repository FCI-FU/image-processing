function maskedImage = WeightedFilter(originalImage)
    maskedImage = padarray(originalImage,[1 1],'replicate', 'both');
    [new_rows, new_cols, Dimension] = size(maskedImage);
    originalImage=double(originalImage);
    newImage = zeros(size(originalImage));
    newImage = double(newImage);
    weightMask=[1,2,1,2,4,2,1,2,1];
    weightMask = double(weightMask);
    for i=1:Dimension
        for row=2:new_rows-1
            for col=2:new_cols-1
                z=1;
                sum=0;
                sum = double(sum);
                for x=row-1:row+1
                    for y=col-1:col+1
                        sum = sum + double( maskedImage(x,y,i) * weightMask(z) );
                        z = z+1;
                    end
                end
                newImage(row-1,col-1,i) = sum/16.0;
            end
        end
    end
    newImage = uint8(newImage);
    maskedImage = newImage;
    %figure, imshow(newImage), title('Weighted Filter Image');
end

