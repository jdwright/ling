function map = makeredbluemap()
for a = 1:128
    b = (a-1)/128;
    map(a,:) = [ 1 b b ];
    map(257-a,:) = [ b b 1 ];
end
