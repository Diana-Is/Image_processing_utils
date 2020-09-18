function [Bl_Ns,std_noise,Bl]=distort(I,std_psf_ratio,SNR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function, distorting an image with particular parameters
%Parameters:
%I-original image
%SNR-linear signal-to-noise ratio
%std_psf_ratio - size of 2d gaussian support, percent of image size
%Bl_Ns-distorted image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
En=sum(sum(I.^2))/numel(I);
std_noise=sqrt(En/SNR);
vpa(std_noise)
padding=size(I)/2;
if std_psf_ratio==0
    Bl=I; 
else
if std_psf_ratio<0.01 || std_psf_ratio>1
error('wrong_ratio');
end
    size_1=ceil(min(size(I))*std_psf_ratio);
    if mod(size_1,2)==0
    size_1=size_1-1;
    end
  f_K=paddd(I);
  (size_1-1)/6
   Kern=fspecial('gaussian',size(f_K)-1,((size_1-1)/6));
   KERN=my_psf2otf(Kern,[size(f_K,1),size(f_K,2)]);
  f_D=ifft2( fft2(f_K) .*KERN);
  Bl=f_D(padding(1)+1:padding(1)+(size(I,1)), padding(2)+1:padding(2)+(size(I,2)));
  
end
Bl_Ns = Bl + std_noise*randn(size(Bl));
Bl_Ns(Bl_Ns > 1) = 1;
Bl_Ns(Bl_Ns < 0) = 0;
Bl_Ns=(im2double(Bl_Ns));
end

function otf=my_psf2otf(psf, outSize)
   psfSize=size(psf);
   padSize = outSize -  psfSize;
   psf     = padarray(psf, padSize, 'post');
   psf    = circshift(psf,-floor(psfSize/2));
   otf = fft2(psf);
end






