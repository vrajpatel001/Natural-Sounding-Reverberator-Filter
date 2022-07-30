% IIR All Pass Reverberation Filter
% Author: Vraj Patel
clc; clear all; close all;

% REVERB (Reverberation) – The effect which may be added to audio during recording 
% or to a voice during performance that sustains the sound longer than normal, 
% as if the sound was reverberating around a large building (e.g., cathedral). 
% It is persistence of the sound after the source has ceased.

% Allpass reveberator with a=0.8 for R=8
[audio_samples,sampling_rate]=audioread('Vraj_Voice.m4a');
% give your audio file path

num=[0.8,zeros(1,799),1];
den=[1,zeros(1,799),0.8];
d1=filter(num,den,audio_samples);
% soundsc(d1,sampling_rate);
audiowrite('ap_rever.wav',d1,sampling_rate);

figure;
% General Impulse response with a=0.8 for R=8
subplot(1,2,1);
I =[1,zeros(1,120)];
numi=[0.8,zeros(1,7),1];
deni=[1,zeros(1,7),0.8];
filt(numi,deni)
d2= filter(numi,deni,I);
stem(d2); grid on;
axis([0,120,-1,1]);
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
stem(d1,'r','DisplayName','All Pass Reverberator');
hold off;
legend show;
xlabel('Sample index');
ylabel('Amplitude');
title('Audio Impulse response with a=0.8 for R=800');

subplot(1,2,2);
[h2,w1] = freqz(num,den,512);
plot(w1/pi,20*log10(abs(h2)),'b'); grid on;
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Magnitude response with a=0.8 for R=800');