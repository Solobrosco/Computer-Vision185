% sobel_feature.m
function [magnitude, orientation] = sobel_feature(img)
    hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];
    hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    
    img_y = imfilter(img, hy);
    img_x = imfilter(img, hx);
    
    magnitude = sqrt(img_y.^2 + img_x.^2);
    orientation = atan2(img_y, img_x);
end