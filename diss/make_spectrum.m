function out = make_spectrum()
f = [ 300 2300 3000 4000 7000 ];
a = [ 5 30 30 30 10 ];
bw = [ 80 80 200 200 200 ];
out = zeros(1,1000);
for x = 1:length(f)
    out = out + a(x)*make_formant(f(x),bw(x));
end
end
