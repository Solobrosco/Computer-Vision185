% 1. Sets green channel to zero
    img = imread('01.jpg');
    I = img;
    I(:,:,2) = 0;
    figure, imshow(I);
% 2. Converts image from RGB to gray scale without using built-in functions
    I2R = img(:,:,1);
    I2G = img(:,:,2);
    I2B = img(:,:,3);
    I2 = zeros(size(img,1), size(img,2), 'uint8');
    for x = 1:size(img,1)
        for y = 1:size(img,2)
            I2(x,y) = (I2R(x,y)*0.333) + (I2G(x,y)*0.333) + (I2G(x,y)*0.333);
        end
    end
    figure, imshow(I2);
% 3. Rotating 90 degree
    I3 = imrotate(img,90);
    figure, imshow(I3);
% 4. Cropping the image given the upper left point (30, 100) and lower right point (270, 300)
    I4 = imcrop(img,[30,100,270,300]);
    figure, imshow(I4);
% 5. Horizontally flipping the image
    I5 = flip(img); 
    figure, imshow(I5);
% 6. Combining 4 images (01.jpg ~ 04.jpg) into one matrix with 2 x 2 grid and 10 pixels separations
    img2 = imread('02.jpg');
    img3 = imread('03.jpg');
    img4 = imread('04.jpg');
    height = 300 * 2 + 10;
    width = 400 * 2 + 10;
    canvas = zeros(height, width, 3, 'uint8');
    canvas(1:300,1:400,:) = img;
    canvas(1:300,411:810,:) = img2;
    canvas(311:610,1:400,:) = img3;
    canvas(311:610,411:810,:) = img4;
    I6 = canvas;
    figure, imshow(I6);
% 7. Converting images (05.jpg and 06.jpg) to vectors and averaging them
    img5 = imread('05.jpg');
    img6 = imread('06.jpg');
    img5V = img5(:);
    img6V = img6(:);
    avg = (img5V + img6V)/2;
    I7 = reshape(avg, 375, 1242, 3);
    figure, imshow(I7);
% 8. Outputting images
    imwrite(I, 'green.jpg');
    imwrite(I2, 'gray.jpg');
    imwrite(I3, 'rotate.jpg');
    imwrite(I4, 'crop.jpg');
    imwrite(I5, 'flip.jpg');
    imwrite(I6, 'combine.jpg');
    imwrite(I7, 'average.jpg');