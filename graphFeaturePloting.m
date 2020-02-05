F=load('E:\ARYAN\Desktop\BCI\checkr_3.txt');
y=F(:,13); 
y=y';
y=y(10291:15462);
Fs=256;
T=1/Fs;
L=length(y);
t=(0:(L-1))*T;
[b,a] = butter(4,[3/256 30/256],'bandpass');
y = filter(b,a,y);
% [b,a] = butter(4,[47/256 53/256],'stop');
% y = filter(b,a,y);
subplot(2,2,2)
hold on 
grid on
axis([0 5 -10 10]);
plot(t,y); %fft
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
subplot(2,2,4)
hold on
grid on
title('FFT Power Density')
periodogram(y)
% NFFT = 2^nextpow2(L);
% Y = fft(y,NFFT)/L;
% f = Fs/2*linspace(0,1,NFFT/2+1);
% Y1 = abs(Y(1:NFFT/2+1)).^2;
% Plot single-sided amplitude spectrum.
%figure(2);
%plot(f,Y1) 
%title('Single-Sided Amplitude Spectrum of y(t)')
%xlabel('Frequency (Hz)')
%ylabel('|Y(f)|')
subplot(2,2,1)
axis([0 200 -30 30])
hold on
grid on
plot(F(:,13),'r-')
subplot(2,2,3)
hold on
grid on
title('Power Density')
periodogram(F)