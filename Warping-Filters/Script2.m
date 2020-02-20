
% Rotating 01.jpg by 45 degree using forward warping, saved as rotate_0.jpg
I = imread("01.jpg");
Isize = size(I);

theta = -pi/4; 
origin = [300/2, 400/2];
x0 = origin(1);
y0 = origin(2);
Irotate = zeros(300, 400, 3, 'uint8');

for x1 = 1:Isize(1) 
    for y1 = 1:Isize(2)
        x2 = cos(theta)*(x1 - x0) + sin(theta)*(y1 - y0) + x0; 
        y2 = -sin(theta)*(x1 - x0) + cos(theta)*(y1 - y0) + y0; 
        x2 = round(x2); y2 = round(y2);
        if(x2 > 0 && x2 <= 300) && (y2 > 0 && y2 <= 400)
            Irotate(x2,y2, :) = I(x1, y1,:);
        end      
    end
end

figure, imshow(Irotate);
imwrite(Irotate, 'rotate_0.jpg');

% Rotating 01.jpg by 45 degree using backward warping, saved as rotate_1.jpg
I2 = imread("01.jpg");
Isize2 = size(I2);

theta2 = pi/4; 
origin2 = [300/2, 400/2];
x0 = origin2(1);
y0 = origin2(2);
Irotate1 = zeros(300, 400, 3, 'uint8');

for x1 = 1:Isize2(1) 
    for y1 = 1:Isize2(2)
        x2 = cos(theta2)*(x1 - x0) - sin(theta2)*(y1 - y0) + x0; 
        y2 = sin(theta2)*(x1 - x0) + cos(theta2)*(y1 - y0) + y0; 
        x2 = round(x2); y2 = round(y2);
        if (x2 > 0 && x2 <= 300) && (y2 > 0 && y2 <= 400)
            Irotate1(x2,y2, :) = I2(x1, y1,:);
        end
    end
end
figure, imshow(Irotate1);
imwrite(Irotate1, 'rotate_1.jpg');

% Implementing median_filter.mfor lena_noisy.jpg, using patch size = 3, saved as median_0.jpg
I3 = imread("lena_noisy.jpg");

pSize = [3,3];

median0 = medianFilter(I3, pSize);

figure, imshow(median0);
imwrite(median0, 'median_0.jpg'); 


% Using patch size = 5, saved as median_1.jpg
I4 = imread("lena_noisy.jpg");

pSize2 = [5,5];

median1 = medianFilter(I4, pSize2);

figure, imshow(median1);
imwrite(median1, 'median_1.jpg'); 

% Function Definitions
function img = medianFilter(I, patch)
    newI = zeros(512, 512, 'uint8'); 
    imgSize = size(I); 
    tempP = zeros(patch); 
    for i = 1: imgSize(1) - patch(1)
        for j = 1: imgSize(2) - patch(2) 
          tempP = I(i:i + patch - 1, j: j + patch - 1);
          middle = median(median(tempP)); 
          newI(i,j) = middle;
        end
    end
    img = newI;
end

% NOTES

% Translation
% I2 = zeros(300, 400 + 50, 3, 'uint8');
% for y1 = 1 : 300
%   for x1 = 1 : 400
%       y2 = ???
%       x2 = ???
%       I2(y2, x2, :) = I1(y1, x1, :);
%   end
% end
% Submatrix Indexing
% I2 = zeros(300, 400 + 50, 3,'uint8');
% I2(1:300,51:400+50,:) = I1;

% Forward Warping Pseudocode
% for each pixel (y1, x1) in I1:
%   (y2, x2) = Rotate(y1, x1)
%   if (y2, x2) is inside I2:
%       I2(y2, x2) = I1(y1, x1)
%   end
% end

% Backward/Inverse Warping Pseudocode
% for each pixel (y2, x2) in I2:
%   (y1, x1) = Rotate^-1(y2, x2)
%   if (y1, x1) is inside I1:
%       I2(y2, x2) = I1(y1, x1)
%   end
% end

% Using nearest neighbor sampling
% (y1, x1) = Rotate ^-1 (y2, x2)
% y1 = round(y1);
% x1 = round(x1);
% If( 1 <= y1 && y1 <= H && 1 <= x1 && x1 <= W )
% ...

% Linear Filter
% I1 = im2double(imread(‘lena.jpg’));
% I2 = zeros(size(I1));
% for u = 1 : size(I1, 2)
%   for v = 1 : size(I1, 1)
%       value = ???;
%          I2(v, u) = value;
%   end
% end

