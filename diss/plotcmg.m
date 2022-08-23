function plotcmg(cmg,voff)
%voff = 30;
sf = 30; % smooth factor
[r,c] = size(cmg);
line = zeros(c);
%plot(smooth(cmg(1,:))+voff);
for a = 1:r
    plot(line+voff*a);
    plot(smooth(cmg(a,:),sf)*-1+(voff*a-(voff/2)));
end
