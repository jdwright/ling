function out = bal2(frame)
[r,c] = size(frame);
midr = floor(r/2);
midc = floor(c/2);
w1 = [ midr:-1:1 1:midr ];
w1 = repmat(w1',1,c);
w2 = [ midc:-1:1 1:midc ];
w2 = repmat(w2,r,1);
fw1 = frame .* w1;
fw2 = frame .* w2;
%a = sum((mid:-1:1) * frame(1:mid,:));
%b = sum((1:mid) * frame(mid+1:r,:));
a = sum(sum(fw2(:,1:midc)));
b = sum(sum(fw2(:,midc+1:c)));
%s = a+b;
%d = abs(a-b);
%out = s - d;
if (a == 0) && (b == 0)
    out = 0;
else
    if a > b
        rt = b/a;
    else
        rt = a/b;
    end
    out = rt * sum(frame(:,midc));
end
end
