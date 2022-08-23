function out = make_filt2()
forms = [ 400 2200 2800 3300 3800 ];
f = zeros(1,length(forms)*2);
f1 = forms - 40;
f2 = forms + 40;
for x = 1:length(forms)
    f(x*2-1) = f1(x);
    f(x*2) = f2(x);
end

f = [
    0
    350
    400 %f1
    450 %f1
    500
    2300
    2450 %f2
    2600 %f2
    2650
    2800
    2850 %f3
    3000 %f3
    3050
    3100
    3150 %f4
    3300 %f4
    3550
    3700
    3750 %f5
    4000 %f5
    4050
    8000
    ];
f = f / 8000;
w = [ 10 1 10 1 1 1 1 1 1 1 10 ];
a = [ 0 0 5 5 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 ];
out = cfirpm(255,f,a,w);
fvtool(out,1);
end
