function out = cmassg2(data,bw,tw)
data = data + abs(min(data(:)));
[r,c] = size(data);
r2 = r-bw+1;
c2 = c-tw+1;
out = zeros(r2,c2);
for a = 1:c2 % time domain
    mxv = 0;
    mxb = 1;
    for b = 1:r2 % freq domain
        frame = data(b:b+bw-1,a:a+tw-1);
%        out(b,a) = cmass(frame);
%        out(b,a) = bal3(frame);
        %mx = bal4(frame);
        mx = sum(frame(:));
%        mx = abs(bal3(frame));
        if mx > mxv
            mxv = mx;
            mxb = b;
        end
%        out(b,a) = mean(frame);
%        y = mean(frame(:));
%        y = bal4(frame);
        %if data(b,a) ~= 0
        %    out(b,a) = x;
        %else
        %    out(b,a) = 0;
        %end
%        out(b,a) = median(frame) / max(frame);
%        out(b,a) = delta2(data(b:b+bw-1,a:a+tw-1));
%        out(b,a) = relden(data(b:b+bw-1,a:a+tw-1));
    end
    out(mxb,a) = 1;
end
%for a = 1:numfull
%    out(a,:) = smooth(deriv(smooth(out(a,:),20)),20);
%    out(a,1:3) = [ 0 0 0 ];
%    out(a,r-2:r) = [ 0 0 0 ];
%end
