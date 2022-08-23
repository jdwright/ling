function out = func1(fs)
nyq = 11025;
sp = plot_form1_1(fs);
%sp = [ sp zeros(1,nyq-length(sp)) ];
%plot(sp(1:100:4000))
plot(sp)
min(sp)
aa = [ ];
ff = [ ];
hold on
icutoff = 5;
cutoff = icutoff;
for f = 1:length(fs)
    if f == length(fs)
        midpoint = nyq-50;
    else
        midpoint = round(mean([ fs(f) fs(f+1) ]));
    end
    bands1 = bands_limit(fs(f),midpoint-icutoff);
    bands2 = bands_limit(fs(f),cutoff);
    ff = [ ff bands1 bands2 ];
    cutoff = midpoint+icutoff;
end
%ff = [ 1 ff(length(ff))+50 ff ];
%ff = [1 4000 ff ];
ff = sort(ff);
ff2 = [ 1 ff ];
%sp = sp + (1:nyq)*.002;
for fi = 1:length(ff2)/2;
    vec = [ ff2(fi*2-1) ff2(fi*2) ];
    plot(vec,sp(vec))
end

hold off
%hold on
%plot([fs(1)-10 fs(1)-1 fs(1)+1 fs(1)+10],[sp(fs(1)-10) sp(fs(1)-1) sp(fs(1)+1) sp(fs(1)+10)]);
sep = 1;
aa = sp(ff);
ff = ff/nyq;
ff = [ 0 ff 1 ];
aa = 10.^(aa/20);
aa = [ 0 aa 0 ];
w = ones(1,length(aa)/2);
%out = cfirpm(255,ff,aa,w);
ff
out = fir2(255,ff,aa);
%hold off
%plot(ff,aa)
%plot(sp)
