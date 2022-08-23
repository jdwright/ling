function out = bands_limit(start,limit)
gap = 5;
incs = [ 50 0 100 50  ];
incs(2) = incs(3)-incs(1)+gap;

if limit < start
    incs = incs * -1;
end
bands1 = start+incs(1):incs(2):limit;
bands2 = start+incs(3):incs(2):limit;
if length(bands1) == length(bands2)
    bands2 = bands2(1:length(bands2)-1);
end
bands3 = incs(4:length(incs)) + start;
out = [ bands1 bands2 bands3 ];
end
