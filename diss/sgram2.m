function pic = sgram2(sgram)
[r,c] = size(sgram);
sgram = 10 * log10(sgram / 2e-5);
sgram = sgram - 60;
for a = 1:r
    for b = 1:c
        if sgram(a,b) < 0
            sgram(a,b) = 0;
        end
    end
end

%sgram = sgram .^ 2;
%sgram = sgram / maxv;
%sgram = ((2*maxv - sgram) / maxv) .* sgram;
%sgram = sgram .* (256/maxv);
maxv = max(sgram(:));
%for a = 1:r
%    pic(c:-1:1,a) = maxv - sgram(a,:);
%end
pic = maxv - sgram;
