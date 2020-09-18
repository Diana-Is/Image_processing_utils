# Image processing utils
Several images processing utilities written for Matlab/Octave (code commented): 
- __distort.m__ -- function, distorting a grayscale input image with Gaussian blur kernel and additive Gaussian noise. 
Image is symmetrically padded in order to avoid ringing artifacts caused by FFT-convolution.
- __dcnvwiener.m__ -- Wiener deconvolution for restoring a grayscale image corrupted with Gaussian blur kernel and additive gaussian noise (guessed/known distortion parameters are input arguments). 
Image is symmetrically padded in order to avoid ringing artifacts caused by FFT-convolution.
- __noise_press.m__ -- Wiener filtering for denoisisng a grayscale image corrupted with additive gaussian noise (guessed/known distortion parameters are input arguments). 
Image is symmetrically padded in order to avoid ringing artifacts caused by FFT-convolution.
- __PSNR.m__ -- PSNR metrics for 2 images calculation (original and restored).
- __prepare_image.m__ -- turning a color image to grayscale and correcting values.
- __phase_portrait.m__ -- displaying phase portrait of an image.
- __Rad_sum_Spectum.mat__ -- data, averaged spectrum of several grayscale images, used for replacing the power spectrum of the unknown image under restoration. 
One can refer to https://www.mathworks.com/matlabcentral/fileexchange/23636-radially-averaged-power-spectrum-of-2d-real-valued-matrix, to have an idea, how such spectrum can be obtained.
