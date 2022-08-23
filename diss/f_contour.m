function out = f_contour(samples,fs)

n = 2000; % roughly 80 ms transition (although effectively smaller)
x = 0:n;
fm = [ (fs(1)-200)*x./(10+x)+200   ;
       (fs(2)-1000)*x./(10+x)+1000 ;
       (fs(3)-2000)*x./(10+x)+2000 ];

   
fs = fs';
out = repmat(fs,1,samples);
out(:,1:n+1) = fm;
out(:,samples:-1:samples-n) = fm;

p = -1*((1:samples)-samples/2).^20;
out(1,:) = p / abs(min(p)) * (fs(1)-300) + fs(1);

out = repmat(fs,1,samples); % line plot

end