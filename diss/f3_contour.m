function out = f3_contour(samples,f3)
samp_rate = 22050;

n = 2000; % roughly 80 ms transition (although effectively smaller)
x = 0:n;
out = [ (f3-2000)*x./(10+x)+2000 zeros(1,samples-n-1)+f3 ];

end
