function out = detect_help(minx,maxx,miny,maxy,x,y)
if x < minx || x > maxx || y < miny || y > maxy
    out = 0;
else
    out = 1
end
