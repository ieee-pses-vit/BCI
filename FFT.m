a=load('E:\ARYAN\Desktop\BCI\checkr_3.txt');
y=a(:,13); 
y=y';
y=y(1:15462);
Fs=256;
T=1/Fs;
L=length(y);
t=(0:(L-1))*T;
figure(1);
[b,a] = butter(4,[3/256 30/256],'bandpass');
y = filter(b,a,y);
% [b,a] = butter(4,[47/256 53/256],'stop');
% y = filter(b,a,y);
plot(t,y);
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
NFFT = 2^nextpow2(L);
Y = fft(y,NFFT)/L
f = Fs/2*linspace(0,1,NFFT/2+1);
Y1 = abs(Y(1:NFFT/2+1)).^2;
% Plot single-sided amplitude spectrum.
figure(2);
plot(f,Y1) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
