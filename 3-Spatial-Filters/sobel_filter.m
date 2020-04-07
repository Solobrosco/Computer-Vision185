function img_filtered = sobel_filter(img, kernel)
    I2 = zeros(size(img));
    for u = 1 : size(img, 2)
        for v = 1 : size(img, 1)
            value = 0;
            for i= -1:1
                for j = -1:1
                    if v+i <= 0 || u+j <= 0 || v+i >= size(img,1) || u+j >= size(img,1)
                        continue;
                    else
                    value = value + img(v+i, u+j) * kernel(i+2, j+2);
                    end
                end
            end
            I2(v, u) = value;
        end
    end
    img_filtered = I2;
end
