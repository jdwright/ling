function out = bal3(frame)
[r,c] = size(frame);
midr = floor(r/2);
midc = floor(c/2);
w1 = [ -midr:-1 1:midr ];

wr = [ -midr:-1 1:midr ];
wc = [ -midc:-1 1:midc ];
w4 = [ repmat(wr',1,midc)  repmat(-wr',1,midc) ];
w5 = [ repmat(wc,midr,1) ; repmat(-wc,midr,1)  ];
w6 = w4 + w5;
w2 = [ -midc:-1 1:midc ];
%w2 = repmat(w2,r,1);
out = sum(w1 * frame);
%fw2 = sum(frame * w2');
%a = sum((mid:-1:1) * frame(1:mid,:));
%b = sum((1:mid) * frame(mid+1:r,:));
%a = sum(sum(fw2(1:midr,:)));
%b = sum(sum(fw2(midr+1:r,:)));
%s = a+b;
%d = abs(a-b);
%out = s - d;
%out = r * sum(frame(midr,:));
