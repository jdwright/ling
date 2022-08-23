function img(mat)
mn = min(mat(:));
mx = max(mat(:));
if mx > abs(mn)
    mat(1,1) = -mx;
else
    mat(1,1) = -mn;
end
imagesc(mat)
