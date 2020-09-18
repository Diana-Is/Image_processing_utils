function Unnoised=noise_press(Bl_Ns,Power_Cor_Signal,var,mode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function for noise supression on image using wiener filtering
%Bl_Ns -- blurred (or not) image with additive gaussian noise
%mode = "cheat" (we know power of the original signal)
%mode = "honest" (we do not know power of the original signal)
%Power_Cor_Signal -- power of the original signal
%var -- known or guessed variance of additive gaussian noise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
padding=size(Power_Cor_Signal)/4;
if strcmp(mode,'cheat')
Power_Signal=Power_Cor_Signal;
elseif strcmp(mode,'honest')
Power_Signal=(Power_Cor_Signal-var);
Power_Signal(Power_Signal<0)=0;
M=min(min(Power_Signal(find(Power_Signal))));
Power_Signal(Power_Signal==0)=M;
end
%Wiener filtering
H_R=ones(size(Power_Signal))./((ones(size(Power_Signal)))+var./Power_Signal); 
Filtered=fft2(Bl_Ns).*H_R;
Unnoised=real(ifft2(Filtered));
Unnoised=Unnoised(padding(1)+1:padding(1)+padding(1)*2, padding(2)+1:padding(2)+padding(2)*2);
end