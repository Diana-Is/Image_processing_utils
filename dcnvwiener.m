function DCNV=dcnvwiener(Bl_Ns,std_psf_ratio,var,sum_spectrum)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function, performing wiener deconvolution
%Bl_Ns -- gaussian blurred image with additive gaussian noise
%std_psf_ratio -- known or guessed size of support of 
%gaussian blurred kernel
%var -- known or guessed noise variance
%sum_spectrum -- averaged spectrum of multiple images,
%for replacing unknown original signal spectrum 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if std_psf_ratio==0
   DCNV=Bl_Ns;
else
Size_input=size(Bl_Ns);
    size_1=ceil(min(size(Bl_Ns))*std_psf_ratio);
    if mod(size_1,2)==0
    size_1=size_1-1;
end

Bl_Ns=padarray(Bl_Ns,size(Bl_Ns)/2,'symmetric');
h2=fspecial('gaussian',size(Bl_Ns)-1, (size_1-1)/6);

padding=Size_input/2;

H_D2=my_psf2otf(h2,[size(Bl_Ns,1),size(Bl_Ns,2)]);
Power_H=abs(H_D2).^2;


Bl_NSF=fft2(Bl_Ns);
Power_Signal=fftshift(sum_spectrum);
Bl_NSF(abs(Bl_NSF.^2)/numel(Bl_Ns)<2*var)=0;
FILTER=conj(H_D2)./(Power_H+(var)./(Power_Signal));

Filtered=Bl_NSF.*FILTER;
DCNV=real(ifft2(Filtered));
DCNV = DCNV(padding(1)+1:padding(1)+(Size_input(1)), padding(2)+1:padding(2)+(Size_input(2)));
 
end
end

function otf=my_psf2otf(psf, outSize)
   psfSize=size(psf);
   padSize = outSize - psfSize;
   psf     = padarray(psf, padSize, 'post');
   psf    = circshift(psf,-floor(psfSize/2));
   otf = fft2(psf);
end
