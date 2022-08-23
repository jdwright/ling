function out = make_period(oq,t2q)
x = 0:.001:.7;
x = exp(x) .* sin(2*pi*x);
total = round(700 / oq);
ct = total - 700;
t2t = round(ct*t2q);
ct = ct - t2t;
inc = 10 / t2t;
ww = (1/1.8).^(inc:inc:10);
out = [ x ww*x(701) zeros(1,ct) ];
end