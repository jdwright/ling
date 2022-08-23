function out = f2_contour(samples,f2)
samp_rate = 22050;

n = 2000; % roughly 80 ms transition (although effectively smaller)
x = 0:n;
out = [ (f2-1000)*x./(10+x)+1000 zeros(1,samples-n-1)+f2 ];

end
