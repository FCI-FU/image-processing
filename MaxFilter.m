function maskedImage = MaxFilter(originalImage)
    maskedImage = padarray(originalImage,[1 1],'replicate', 'both');
    [new_rows, new_cols, Dimension] = size(maskedImage);
    newImage = zeros(size(originalImage));
    
    %% ====== Start Applying the Filter on the New Image ======= 
     
    for i=1:Dimension
        for row=2:new_rows-1
            for col=2:new_cols-1
                z=1;
                arr = zeros(9,1);
                for x=row-1:row+1
                    for y=col-1:col+1
                        arr(z) = maskedImage(x,y,i);
                        z=z+1;
                    end
                end
                Max = max(arr);
                newImage(row-1,col-1,i) = Max;
            end
        end
     end
    
    %%
    %%Display the new image
    newImage = uint8(newImage);
    maskedImage = newImage; 
    %figure, imshow(newImage), title('Max Filter Image');
end

