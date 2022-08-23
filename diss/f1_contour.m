function out = f1_contour(samples,f1)
samp_rate = 22050;
%n = round(.02*samp_rate); % .02 sec transition
%out = [ -3*((n:-1:1)/n*10).^2  zeros(1,samples-n) ] + f1;
%out = zeros(1,samples) + f1;
%out = (1:samples)/samp_rate;
%out = -200*(out-1).^2 + f1;

n = 2000; % roughly 80 ms transition (although effectively smaller)
x = 0:n;
out = [ (f1-200)*x./(10+x)+200 zeros(1,samples-n-1)+f1 ];

end

