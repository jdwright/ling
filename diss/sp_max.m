function out = sp_max(data,bw,tw)
% bw and tw are half-bandwidths
% find max energy frame, in time domain
[r,c] = size(data);
out = zeros(r,c);
for a = 1+tw:c-tw % time domain
    mxv = 0;
    mxb = 1;
    for b = 1+bw:r-bw % freq domain
        mx = sum(sum(data(b-bw:b+bw,a-tw:a+tw)));
        if mx > mxv
            mxv = mx;
            mxb = b;
        end
    end
    out(mxb,a) = 1;
end
