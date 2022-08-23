function out = deriv2(mat,n)
% n should be odd (i think)
[r,c] = size(mat);
out = zeros(r,c);
m = floor(n/2);
for a = 1:r
    for b = 1+m:c-m
        if mat(a,b-m) == 0
            out(a,b) = 0;
        elseif mat(a,b+m) == 0
            out(a,b) = 0;
        else
            out(a,b) = mat(a,b+m) - mat(a,b-m);
        end
    end
end
