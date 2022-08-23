function x = search(data,rs,cs)
[r,c] = size(data);
m = 0;
x = 0;
y = 0;
for a = rs+1:r-rs
    for b = cs+1:c-cs
        m2 = sum(sum(data(a-rs:a+rs,b-cs:b+cs)));
        if m2 > m
            m = m2;
            x = a;
            y = b;
        end
    end
end
imagesc(data);
hold on
rectangle('Position',[ y-cs x-rs cs*2+1 rs*2+1 ]);
hold off
