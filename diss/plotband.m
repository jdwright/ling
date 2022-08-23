function plotband(vec,beg,endd)
mid = (endd-beg)/2;
mx = max(abs(vec));
ln = zeros(length(vec));
plot(ln+beg);
plot(ln+endd);
plot(vec/mx*-mid+beg+mid);
