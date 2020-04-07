function filter = gaussian_filter(I, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    I1 = zeros(size(I));
    for u = 1 : size(I, 2)
        for v = 1 : size(I, 1)
            val = 0;
            for i= -sigma:sigma
                for j = -sigma:sigma
                    if v+i <= 0 || u+j <= 0 || v+i >= size(I,1) || u+j >= size(I,1)
                        continue;
                    else
                    val = val + I(v+i, u+j) * H(i+sigma+1, j+sigma+1);
                    end
                end
            end
            I1(v, u) = val;
        end
    end
    filter = I1;
end