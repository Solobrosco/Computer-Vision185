% Harris_corner_detector.m
function [c_x, c_y] = Harris_corner_detector(I, sig1, sig2, alpha, r_threshold)
    h1 = 1 + 2 * ceil(sig1 * 2);
    h2 = 1 + 2 * ceil(sig2 * 2);
    
    gaussian_1 = fspecial('gaussian', h1, sig1);
    gaussian_2 = fspecial('gaussian', h2, sig2);
    
    dx = [1, 0, -1];
    dy = [1; 0; -1];
    
    Ix = imfilter(I, dx);
    Ix = imfilter(Ix, gaussian_1);
    
    Iy = imfilter(I, dy);
    Iy = imfilter(Iy, gaussian_2);
    
    Ixx = Ix .* Ix;
    Ixy = Ix .* Iy;
    Iyy = Iy .* Iy;
    
    xx = imfilter(Ixx, gaussian_2);
    yy = imfilter(Iyy, gaussian_2);
    xy = imfilter(Ixy, gaussian_2);
    
    detM = xx .* yy - xy .* xy;
    traceM = xx + xy;
    r = detM - (alpha .* traceM.^2);
    
    corner = r > r_threshold;
    
    local_maxima = imregionalmax(r)
    final_map = corner & local_maxima;
    [c_y, c_x] = find(final_map);
end