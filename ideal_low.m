function updateImage=ideal_low(photo,D0)
[M,N,K]=size(photo);
updateImage = zeros(M,N,K);
FT = fft2(photo);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);

for k=1:K
  for u=1:M
     for v=1:N
       D=((u-M/2 )^2+(v-N/2)^2)^0.5  ; 
        if(D <= D0)
                  updateImage(u,v,k)=1;
             
                else 
        updateImage(u,v,k)=0;
        end
    end  
   end
end
 Real = Real.*updateImage;
 Imag = Imag.*updateImage;

  IFTS = ifftshift(Real + 1i * Imag);
 IFT = ifft2(IFTS);
updateImage=uint8(IFT);
end

