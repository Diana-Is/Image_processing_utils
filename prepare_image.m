function I=prepare_image(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function for making color color image 
% grayscale and correcting numerical values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ndims(I)>2
I=rgb2gray(I);
end
I=im2double(I);
I(I>1)=1;
I(I<0)=0;
end