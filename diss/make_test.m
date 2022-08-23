function out = make_test(source,v)
n = 100;
inc = 1/n;
sep = inc/10;
f = [ inc:inc:(1-inc) ];
f1 = f - sep;
f2 = f + sep;
f = sort([ 0 1 f1 f2 ]);
w = ones(1,n);
inc = 1000/n;
a = [ v(1) ];
for x = round(1+inc:inc:1000)
    a = [ a v(x) v(x) ];
end
a = [ a 0 ];
%filt = cfirpm(255,f,a,w);
%fvtool(filt,1);
hold on
for x = 1:2:n-1
    plot([f(x) f(x+1)],[a(x) a(x+1)]);
end
hold off
%plot(f,log10(a+.1))
%out = conv(filt,source);
mx = max( [ max(out) abs(min(out)) ] );
out = out / mx;
length(f)
f(1)
f(length(f))
end
