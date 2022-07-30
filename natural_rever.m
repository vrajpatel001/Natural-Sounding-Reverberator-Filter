% Natural Sounding Reverberator
% Author: Vraj Patel
clc; clear all; close all;

a1=0.6; R1=4000;
a2=0.4; R2=2000;
a3=0.2; R3=1000;
a4=0.1; R4=500;
a8=0.05; R8=250;

a5=0.8; R5=1000;
a6=0.8; R6=1000;

a7=0.8;

[audio_samples,sampling_rate]=audioread('Vraj_Voice.m4a');
% give your audio file path
% soundsc(audio_samples,sampling_rate);

num1=[0,zeros(1,R1-1),1];
den1=[1,zeros(1,R1-1),-a1];
d1=filter(num1,den1,audio_samples);
filt(num1,den1)

num2=[0,zeros(1,R2-1),1];
den2=[1,zeros(1,R2-1),-a2];
d2=filter(num2,den2,audio_samples);
filt(num2,den2)

num3=[0,zeros(1,R3-1),1];
den3=[1,zeros(1,R3-1),-a3];
d3=filter(num3,den3,audio_samples);
filt(num3,den3)

num4=[0,zeros(1,R4-1),1];
den4=[1,zeros(1,R4-1),-a4];
d4=filter(num4,den4,audio_samples);
filt(num4,den4)

num8=[0,zeros(1,R8-1),1];
den8=[1,zeros(1,R8-1),-a8];
d8=filter(num8,den8,audio_samples);
filt(num8,den8)

IIR_delayed=d1+d2+d3+d4+d8;
num5=[a5,zeros(1,R5-1),1];
den5=[1,zeros(1,R5-1),a5];
filt(num5,den5)

ALL_1=filter(num5,den5,IIR_delayed);
num6=[a6,zeros(1,R6-1),1];
den6=[1,zeros(1,R6-1),a6];
filt(num6,den6)

ALL_2=filter(num6,den6,ALL_1);
natural_reverb = audio_samples+a7*ALL_2;
% soundsc(natural_reverb,sampling_rate);
audiowrite('natural_rever.wav',natural_reverb,sampling_rate);