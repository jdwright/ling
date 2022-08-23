function out = plot_form(fs,bw)
nyq = 11025;
s = (0:25:nyq) * 2 * pi * j;
out = ones(1,length(s));
%bw = [ 40 50 70 100 200 ];
f = [ fs 5500:1000:200500 ];
for fi = 1:length(f)
    if fi < 6
        bw2 = bw(fi);
    else
        bw2 = 500;
    end
    sn = f(fi)*2*pi*j + bw2 * pi;
    snc = conj(sn);
    out = out .* sn*snc./((s-sn).*(s-snc));
end
%out = 20*log10(abs(out));
out = abs(out);
end
