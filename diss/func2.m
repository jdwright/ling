function out = func2(fs,source)
nyq = 11025;
order = 44;
x = (0:nyq)/nyq;
y = plot_form(fs);
[b,a] = yulewalk(order,x,y);
out = filter(b,a,source);
out = out / max([ max(out) abs(min(out)) ]);
end
