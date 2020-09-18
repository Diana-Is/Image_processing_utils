function decib=PSNR(A,B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PSNR metric for images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if size(A)~=size(B)
error('Images  have different size. Not comparable');
end
if A==B
error('Images are identical; PSNR is undefined');
end
A=prepare(A);
B=prepare(B);
MSE=(sum(sum((abs(A-B).^2))))/numel(A);
Peak=max(max(A));
decib=10*log10(Peak^2/MSE);
sprintf('PSNR=+%f db',decib);

end