% IIR Multi Echo Filter
% Author: Vraj Patel
clc; clear all; close all;

% Echo - A repeated sound received late enough to be heard as distinct from the source.

[audio_samples,sampling_rate]=audioread('Vraj_Voice.m4a');
% give your audio file path 

% IIR filter generating an infinite number of echoes with a=0.8 for R=800
num=[0,zeros(1,799),1];
den=[1,zeros(1,799),-0.8];
d1=filter(num,den,audio_samples);
% soundsc(d1,sampling_rate);
audiowrite('iir_multi_echo.wav',d1,sampling_rate);

figure;
% General Impulse response with a=0.8 for R=8
subplot(1,2,1);
I =[1,zeros(1,120)];
numi=[0,zeros(1,7),1];
deni=[1,zeros(1,7),-0.8];
filt(numi,deni)
d2= filter(numi,deni,I);
stem(d2); grid on;
axis([0,120,0,1]);
xlabel('Sample index');
ylabel('Amplitude');
title('General Impulse response with a=0.8 for R=8');

% General Magnitude response with a=0.8 for R=8
subplot(1,2,2);
[h1,w] = freqz(numi,deni,512);
plot(w/pi,20*log10(abs(h1))); grid on;
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('General Magnitude response with a=0.8 for R=8');

figure;
subplot(1,2,1);
filt(num,den)
stem(audio_samples,'b','DisplayName','Original'); grid on;
hold on;
stem(d1,'r','DisplayName','Multi Echo');
hold off;
xlabel('Sample index');
ylabel('Amplitude');
legend show;
title('Audio Impulse response with a=0.8 for R=800');

subplot(1,2,2);
[h2,w1] = freqz(num,den,512);
plot(w1/pi,20*log10(abs(h2)),'m'); grid on;
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Magnitude response with a=0.8 for R=800');