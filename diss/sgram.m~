function [out] = sgram(data,window_length,time_step,N,drange,fq_lim)
samp_rate = 22050;
window_length = round(window_length*samp_rate);
time_step = round(time_step*samp_rate);
Nover2 = round(N / 2);
if fq_lim ~= 0
    Nover2 = round(fq_lim / (samp_rate/2) * Nover2);
end
num_win = floor((length(data) - window_length) / time_step);
out = zeros(Nover2,num_win);
win = gausswin(window_length)';
buf1 = zeros(1,N);
preemph = 6*log2((1:Nover2)/Nover2*(samp_rate/2)/1000)+6;
preemph(preemph<0) = 0;
for x = 1:time_step:time_step*(num_win-1)+1
    buf2 = buf1;
    buf2(1:window_length) = data(x:x+window_length-1) .* win;
    f = fft(buf2);
    y = ceil(x/time_step);
    out(Nover2:-1:1,y) = 20*log10(2*samp_rate/N*abs(f(1:Nover2))) + preemph;
end
mx = max(out(:)) - drange;
out = out - mx;
out(out<0) = 0;

