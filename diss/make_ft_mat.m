function out = make_ft_mat()
%out = zeros(71,101,51,90);
out = zeros(71*101*51,90);
fs = [ 0 0 0 3500 4500 ];
%a = [ 20 20 15 5 5 ];
bw = [ 40 50 70 100 200 ];
for x = 10:60 %0:70
    fs(1) = x*10+200; % 200 to 900
    xx = x*101*51;
    for y = 0:50 %0:100
        fs(2) = y*20+1000; % 1000 to 3000
        yy = xx+y*51;
        [x y]
        for z = 0:10 %0:50
            fs(3) = z*20+2500; % 2500 to 3500
            %out(x,y,z,:) = make_filter(fs);
            out(yy+z+1,:) = make_filter(fs,bw);
        end
    end
end
end
