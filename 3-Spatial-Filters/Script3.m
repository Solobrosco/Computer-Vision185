
I = im2double(imread("lena.jpg"));

%figure, imshow(I);

% Implemented sobel_filter.m, used H_y filter and saved the image as sobel_y.jpg
H_y = [1, 2, 1; 0, 0, 0; -1, -2, -1];

I1 = sobel_filter(I, H_y);

figure, imshow(I1);

% Used H_x filter and save the image as sobel_x.jpg
H_x = [1, 0, -1; 2, 0, -2; 1, 0, -1];

I2 = sobel_filter(I, H_x);

%figure, imshow(I2);

% Break 2D filter (H_x) to 1D filter, use column-wise filter first and then row-wise filter, save the image as sobel_cr.jpg
H_xnew = [1; 2; 1].*[1,0,-1];

I3 = sobel_filter(I, H_xnew);

%figure, imshow(I3);

% Used row-wise filter first and then column-wise filter, save the image as sobel_rc.jpg
H_ynew = [1; 0; -1].*[1,2,1];

I4 = sobel_filter(I, H_ynew);

figure, imshow(I4);
% Implemented gaussian_filter.m, use hsize= 5, sigma = 2, and save the image as gaussian_5.jpg
sigma = 2;
hsize = 5;
I5 = gaussian_filter(I, hsize, sigma);
%figure, imshow(I5);

% Used hsize= 9, sigma = 4, and save the image as gaussian_9.jpg

sigma = 4;
hsize = 9;
I6 = gaussian_filter(I, hsize, sigma);
%figure, imshow(I6);

% Saving output images

imwrite(I1, 'sobel_y.jpg');
imwrite(I2, 'sobel_x.jpg');
imwrite(I3, 'sobel_cr.jpg');
imwrite(I4, 'sobel_rc.jpg');
imwrite(I5, 'gaussian_5.jpg');
imwrite(I6, 'gaussian_9.jpg');
