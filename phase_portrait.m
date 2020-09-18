function phase_portrait(im)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function for displaying a phase phase_portrait of an image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imp=prepare(im);
impad=padarray(imp,size(Bl_Ns)/2,'symmetric');
padding=size(im)/2;
IMF=fft2(impad);
IMF(abs(IMF)<10)=0;

%im_magnitude = abs(IMF);
im_magnitude = 100*ones(size(impad,1),size(impad,2));
im_phase = angle(IMF);

im_rec = complex(im_magnitude.*cos(im_phase), ...
            im_magnitude.*sin(im_phase));
img_a = ifft2(im_rec);
 img_a=img_a(padding(1)+1:padding(1)+(size(im,1)), padding(2)+1:padding(2)+(size(im,2)));


figure, imshow(im2bw(img_a,0.4));
figure, imshow(img_a)
end