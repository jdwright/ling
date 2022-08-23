function [out,outp] = filter_source(filters,source,per_samps,fs,bw,ampq)
% filter synchronously with glottal periods
% each period has a single filter
samp_rate = 22050;
num_samp = length(source);

%fc = f_contour(num_samp,fs);

%plot(fc');

% quantize formants for filters, down to zero index possibly
%fc(1,:) = (fc(1,:)-200)/10;
%fc(2,:) = (fc(2,:)-1000)/20;
%fc(3,:) = (fc(3,:)-2000)/20;

%fc = round(fc);

%fti = [ 101*51 51 1 ] * fc + 1; % indices into filter matrix

out = zeros(1,num_samp);

%bw = [ 40 50 70 100 200 ];



ns = .01;
%out = out + random('norm',0,ns,1,length(out));
%out = [random('norm',0,ns,1,5000) out random('norm',0,ns,1,5000)];
out = out / max([ max(out) abs(min(out)) ]) * ampq;
%out = out .* gausswin(length(out))';
outp = audioplayer(out,samp_rate);
end
