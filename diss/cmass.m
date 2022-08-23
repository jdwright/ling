function out = cmass(vec)
s = length(vec);
mid = (s-1) / 2 ;
weights = mid:-1:-mid;
total = sum(vec);
if total <= 10 % energy threshold
    out = 0;
else
    vec = vec / total;
    out = weights * vec / mid;
%    out = abs(weights * vec / mid);
end
