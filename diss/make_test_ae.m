function out = make_test(source)
fs = [ 800 1500 2400  ];

f = [ 0 fs(1)-100 fs(1)-5 fs(1)+5 fs(1)+100 ];
f = [ f fs(2)-100 fs(2)-5 fs(2)+5 fs(2)+100 ];
f = [ f fs(3)-100 fs(3)-5 fs(3)+5 fs(3)+100 ];

f = [f 2900 3000 4000 4100 6400 6500 7200 7300 ];

f = [f 8000];

f = f / 8000;

w = ones(1,11);
a = [ 0 1   2 2     1 3   15 15   3 3   15 15   1 1 ];
a = [ a 2 2 0 0 1 1 0 0 ];
filt = cfirpm(255,f,a,w);
fvtool(filt,1);
plot(f,log10(a+.1))
out = conv(filt,source);
mx = max( [ max(out) abs(min(out)) ] );
out = out / mx;
end
