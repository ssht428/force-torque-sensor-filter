clear;
close all;
clc;
%importdata 函数允许加载各种数据的不同格式的文件
fy=importdata('fy_8192_still.csv'); %读取csv数据文件
%disp(data); %disp函数：显示文本或数组
plot(fy);
xlabel('No.'),ylabel('fy/N'); %添加标签
hold on;
Fs = 20000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 8192;             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(fy);
%为何除以信号长度L?
P2 = abs(Y/L);
P1 = P2(1:L/2+1);%单边谱
P1(2:end-1) = 2*P1(2:end-1);%由于P1(1)是直流吧
f = Fs*(0:(L/2))/L;%采样频率Fs,因此只看fs/2内的信号
figure;plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%原始信号S长度1500，进行1500点FFT
Y = fft(fy);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure;plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')