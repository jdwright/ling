    mx = max(vec);
    vec = vec / total;
    md = mean(vec);
    lth = length(vec);
    for a = 1:lth
        if vec(a) < 1/lth
            vec(a) = 0;
        end
        if vec(a) == mx
            mxi = a;
        end
    end
%    out = sum(weights * mat);
    out = weights * vec / mid;
%    out = out / (abs(a-mid-out)+1);
end
