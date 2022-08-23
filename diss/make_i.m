function out = make_i(source)
fs = [ 300 2200 2700 3400 4000 6200 ];

f = [ 0 fs(1)-100 fs(1)-5 fs(1)+5 fs(1)+100 ];
f = [ f fs(2)-300 fs(2)-200 fs(2)-100 fs(2)-5 fs(2)+5 fs(2)+100 ];
f = [ f fs(3)-100 fs(3)-5 fs(3)+5 fs(3)+100 ];
f = [ f fs(4)-100 fs(4)-5 fs(4)+5 fs(4)+100 ];
f = [ f fs(5)-100 fs(5)-5 fs(5)+5 fs(5)+100 fs(5)+200 fs(5)+300];

f = [ f fs(6)-600 fs(6)-500 fs(6)+500 fs(6)+600 ];

f = [f 8000];

f = f / 8000;

w = [ 1 1 1 1 1 1 1 1 1 1 1 1 1 ];
w = [ w 1 1  ];
a = [ 0 1   3 3     0 0   2 4   5 5   2 5   8 8   6 6   7 7   6 2 3 3 1 0 0 0 ];
a = [ a  2 2   0 0   ];
filt = cfirpm(255,f,a,w);
fvtool(filt,1);
plot(f,log10(a+.1))
out = conv(filt,source);
mx = max( [ max(out) abs(min(out)) ] );
out = out / mx;
end
