function out = f1_detector(data,rs,cs)
[r,c] = size(data);
m = .0000001;
x = 0;
y = 0;
a = r-rs;
b = 1+cs;
loop = 1;
while loop
    loop = 0;
%    if detect_help(a,r-rs,cs+1,c-cs,a,b)
    for x = 1:10
        for y = 1:10
            if a-x-rs > 0 && b+y+cs <= c
                m1 = sum(sum(data(a-x-rs:a-x+rs,b+y-cs:b+y+cs)));
                if m1 > m
                    m = m1;
                    a2 = a - x;
                    b2 = b + y;
                    loop = 1;
                end
            end
        end
    end
    a = a2;
    b = b2;
end

out = a;

imagesc(data);
hold on
rectangle('Position',[ b-cs a-rs cs*2+1 rs*2+1 ]);
hold off
