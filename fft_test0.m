Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector
%50Hz和120Hz频率信号
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
%添加随机噪声
X = S + 2*randn(size(t));
figure;plot(1000*t(1:50),X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')
%加噪声后信号X长度1500，进行1500点FFT
Y = fft(X);
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
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure;plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')