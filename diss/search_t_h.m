function [m1,a] = search_t_h(cvec,rs)
r = length(cvec);
a = r-rs;
m1 = sum(cvec(a-rs:a+rs));
m2 = sum(cvec(a-1-rs:a-1+rs));
while m2 >= m1
    a = a - 1;
    m1 = m2;
    m2 = sum(cvec(a-1-rs:a-1+rs));
end
