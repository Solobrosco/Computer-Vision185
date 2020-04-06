% multiscale_sobel_feature.m
function output = multiscale_sobel_feature(img, scale)
    output = [];
    for i = 1:scale
        [magnitude, orientation] = sobel_feature(img);
        f = magnitude;
        output = cat(1, output, f(:));
        img = imresize(img, 0.5);
    end
end