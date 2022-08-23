function out = make_ae(source)
fs = [ 650 1700 2400 3400 4200 6200 ];

f = [ 0 fs(1)-100 fs(1)-5 fs(1)+5 fs(1)+100 ];
f = [ f fs(2)-100 fs(2)-5 fs(2)+5 fs(2)+100 ];
f = [ f fs(3)-100 fs(3)-5 fs(3)+5 fs(3)+100 fs(3)+200 fs(3)+300 ];
%f = [ f fs(4)-100 fs(4)-5 fs(4)+5 fs(4)+100 ];
f = [ f fs(5)-100 fs(5)-5 fs(5)+5 fs(5)+100 fs(5)+200 fs(5)+300 ];

f = [ f fs(6)-600 fs(6)-500 fs(6)+500 fs(6)+600 ];

f = [ 0 550 645 655 700 1600 1700 1710 1800 2300 2400 2410 2510 2900 3000 ];

f = [f 8000];

f = f / 8000;

w = ones(1,8);
a = [0 1 3 3    1 3    8 8   3 3   8 8   1 1   0 0 ];
filt = cfirpm(255,f,a,w);
fvtool(filt,1);
plot(f,log10(a+.1))
out = conv(filt,source);
mx = max( [ max(out) abs(min(out)) ] );
out = out / mx;
fvtool(out,1)
end
