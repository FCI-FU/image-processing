function Resized_image = add_images(image1,image2)
[rows,cols,channels]=size(image1);
image3 = imresize(image2,[rows,cols]);
image4 = zeros(rows,cols,channels);
for i=1:channels    
    for x=1:rows
        for y=1:cols
            image4(x,y,i)=image3(x,y,i)+image1(x,y,i);
            if(image4(x,y,i)>255)
                image4(x,y,i)=255;
            end
            if(image4(x,y,i)<0)
                image4(x,y,i)=0;
            end
        end
    end
end
%Casting image type for show
Resized_image=uint8(image4);
%figure,imshow(Resized_image),title('Resized Image');
end