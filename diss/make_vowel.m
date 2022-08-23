function out = make_vowel(fts,s)
samp_rate = 22050;
time = 1;
%n1 = round(time*samp_rate/2);
%f1 = -n1:n1;
%f1 = f1/n1*100;
%f1 = -10^-6*f1.^4 - 10^-2.5*f1.^2 + 600;
n1 = round(.15*samp_rate);
f1 = n1:-1:1;
f1 = [-3*(f1/n1*10).^2 zeros(1,round(time*samp_rate)-n1)] + 800;
plot(f1)
x = round((f1-300)/10);

f2 = 1600;
y = (f2-500)/20;

%out = zeros(1,2*n1+1);
out = zeros(1,round(time*samp_rate));
val = x(1);
num = 1;
sp = 1;
for xi = 2:length(x)
    if x(xi) == val
        num = num + 1;
    else
        ft = fts(val,y,:);
        ft = ft(:);
        b = ft(1:45);
        a = ft(46:90);
%        outc = conv(ft,s(sp:sp+num-1+255));
%        out(sp:sp+num-1) = outc(256:256+num-1);
        out(sp:sp+num-1) = filter(b,a,s(sp:sp+num-1));
        sp = sp + num;
        val = x(xi);
        num = 1;
    end
end

ft = fts(val,y,:);
ft = ft(:);
b = ft(1:45);
a = ft(46:90);
%outc = conv(ft,s(sp:sp+num-1+255));
%out(sp:sp+num-1) = outc(256:256+num-1);

out(sp:sp+num-1) = filter(b,a,s(sp:sp+num-1));

%for xx = 1:length(x1)-2
%    ft = fts(x1(xx),y,:);
%    ft = ft(:);
%    out(xx) = s(xx:xx+255) * ft;
%end
ns = .01;
out = out + random('norm',0,ns,1,length(out));
out = [random('norm',0,ns,1,5000) out random('norm',0,ns,1,5000)];
out = out / max([ max(out) abs(min(out)) ]);
end
