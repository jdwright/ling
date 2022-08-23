function out = make_vowel3(filters,time,fund,jt,sh,noise,ampq)
[source,per_samps] = make_source(fund,time,jt,sh,noise,ampq);
out = make_vowel(filters,time,source,per_samps);
end
