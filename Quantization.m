function newImage = Quantization(originalImage,k)
    
    newImage = zeros(size(originalImage));
    [rows,cols,dim] = size(originalImage);
    %% ====== Start Applying the Filter on the New Image ======= 
    Gray_level = power(2,k);
    Gap = 256/Gray_level;
    Colors=(Gap:Gap:256);
    for i=1:dim
        for row=1:rows
            for col=1:cols            
                Temp = originalImage(row,col,i)/Gap;
                Index = floor(Temp)+1;
                if(Index > 255)
                    Index = 255;
                elseif(Index < 1)
                    Index = 1;
                end
                newImage(row,col,i)= Colors(Index);
            end
        end
     end
    
    %%
    %%Display the new image
    newImage = uint8(newImage);
    %figure, imshow(newImage), title('quantizated Image');
end