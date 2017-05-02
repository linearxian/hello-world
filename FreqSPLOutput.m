function [f_max, SPL_dB_mean, M] = FreqSPLOutput(signal,samplerate)

y_raw = signal;
Fs = samplerate;

%bandpass filter
% Fstop1 = 100;             % First Stopband Frequency
% Fpass1 = 300;             % First Passband Frequency
% Fpass2 = 14500;           % Second Passband Frequency
% Fstop2 = 15000;           % Second Stopband Frequency
% Dstop1 = 0.001;           % First Stopband Attenuation
% Dpass  = 0.057501127785;  % Passband Ripple
% Dstop2 = 0.0001;          % Second Stopband Attenuation
% dens   = 20;              % Density Factor
% 
% % Calculate the order from the parameters using FIRPMORD.
% [N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
%                           0], [Dstop1 Dpass Dstop2]);
% 
% % Calculate the coefficients using the FIRPM function.
% b  = firpm(N, Fo, Ao, W, {dens});
% Hd = dfilt.dffir(b);
% 
% y = filter(Hd,y_raw);

% A-weighting filter
y = filterA(y_raw, Fs);
% y = y_raw;

%avgfft
dat = y;
frq = Fs;
fftlen = 4096;
tlen = fftlen * 2;
win = hanning(tlen);
wincor = 1/mean(win);
olap = 0.5;

nwin = floor((length(dat)-tlen)/tlen/(1-olap));
magf = zeros(fftlen,1);

for z = 0:nwin-1
    zin = floor(z*tlen*(1-olap));
    fftz = myfft(dat(zin+1:zin+tlen).*win)*wincor/frq;
    magf = magf +abs(fftz(1:fftlen))/nwin;
end

fv = frq/2*linspace(0,1,fftlen); 

% plot(fv,magf)

[M,I] = max(magf);
f_max = fv(I);

%% SPL

my_cal_factor = 1;  %the value for your system to convert the WAV into Pascals
wav_Pa = abs(y .* my_cal_factor);

%compute SPL
Pa_ref = 20e-6;  %reference pressure for SPL in Air
SPL_dB_mean = 20.0*log10(rms(wav_Pa) / Pa_ref); % Effektivwert


