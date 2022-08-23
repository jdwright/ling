function out = pitch_contour(fund,time,type)
samp_rate = 22050;
jitter = 1;
out = zeros(1,floor(samp_rate*time)) + fund;
if type == 1
    % modify pc for jitter
    t = (1:length(out))/samp_rate;
    out = out + (sin(2*pi*12.7*t) + sin(2*pi*4.7*t) + sin(2*pi*2.1*t)) * 1.5 * jitter;
elseif type == 2
    out = out + (1:length(out))/length(out)*50; % falls 50 Hz
end
    
end
