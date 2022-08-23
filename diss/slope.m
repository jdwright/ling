function out = slope(data,width)
[mx,v] = max(data);
weights = -(0:width);
%out = v(2:length(v)) - v(1:length(v)-1);
out = zeros(1,length(v));
for a = 1+width:length(v)-width
    out(a) = v(a:a+width)*weights' - v(a:-1:a-width)*weights';
end

