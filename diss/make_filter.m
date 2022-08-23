function out = make_filter(fs,bw)
% takes formants and bandwidths
% vectors should be of length 5, because plot_form expects that
% returns filter expressed as b and a coefficients
nyq = 11025;
order = 44;
x = (0:25:nyq)/nyq;
y = plot_form(fs,bw);
[b,a] = yulewalk(order,x,y);
out = [ b a ];
end
