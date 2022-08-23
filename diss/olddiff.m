function out = deriv(in)
out = zeros(length(in));
for a length(in):-1:2
    out(a) = in(a) - in(a-1);
end