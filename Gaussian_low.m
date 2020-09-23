function updateImage=Gaussian_low(photo,D0)
 %e=2.7182818284590452353602874713527?;
 e=2.7182818;
% d0=segma^2;
% D0=2*d0;
[M,N,K]=size(photo);
updateImage=zeros(M,N,K);
FT = fft2(photo);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);

for k=1:K
   for u=1:M
     for v=1:N
         
          D=((u-M/2 )^2+(v-N/2)^2)^0.5  ; 
          updateImage(u,v,k)=e^-(D^2/(2*D0^2));
     
     end
   end
end
 Real = Real.*updateImage;
 Imag = Imag.*updateImage;

  IFTS = ifftshift(Real + 1i * Imag);
 IFT = ifft2(IFTS);
updateImage=uint8(IFT);
end