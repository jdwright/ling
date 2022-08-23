function out = positive(mat)
[r,c] = size(mat);
out = zeros(r,c);
for a = 1:r
    for b = 1:c
        if mat(a,b) > 0
            out(a,b) = mat(a,b);
        end
    end
end
