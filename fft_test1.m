clear;
close all;
clc;
%importdata ����������ظ������ݵĲ�ͬ��ʽ���ļ�
fy=importdata('fy_8192_still.csv'); %��ȡcsv�����ļ�
%disp(data); %disp��������ʾ�ı�������
plot(fy);
xlabel('No.'),ylabel('fy/N'); %��ӱ�ǩ
hold on;
Fs = 20000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 8192;             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(fy);
%Ϊ�γ����źų���L?
P2 = abs(Y/L);
P1 = P2(1:L/2+1);%������
P1(2:end-1) = 2*P1(2:end-1);%����P1(1)��ֱ����
f = Fs*(0:(L/2))/L;%����Ƶ��Fs,���ֻ��fs/2�ڵ��ź�
figure;plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%ԭʼ�ź�S����1500������1500��FFT
Y = fft(fy);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure;plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')