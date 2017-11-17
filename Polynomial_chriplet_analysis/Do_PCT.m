function [ specgm , fI , p ] = Do_PCT( Iter , t , y , win , Hop_Size , Nfft ,SampFreq , alpha)
% Iteratively using PCT to achieve best solution

[specgm] = Polynomial_chriplet(y , win , Hop_Size , Nfft ,SampFreq , alpha);
for i = 1 : Iter
    nLevel = round(Nfft/2);
    specgm_temp = specgm(1:nLevel , :);
    f = [0:nLevel-1]/nLevel * SampFreq/2;
    [v, I] = max(specgm_temp,[],1);
    [p, z] = polylsqr(t,f(I),4); 
    [specgm] = Polynomial_chriplet(y , win , Hop_Size , Nfft ,SampFreq , z(2:end));
end
fI = f(I);
end

