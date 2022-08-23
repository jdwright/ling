function out = relden(mat)
cm = cmass(mat);
vec = sum(mat,2);
total = sum(vec);

mid = (length(vec)-1)/2;
weights = mid:-1:-mid;
weights = abs(weights - cm);
if total ~= 0
    out = mid - weights * vec / total;
else
    out = 0;
end

%out = max(vec / sum(vec)) - 1/length(vec);