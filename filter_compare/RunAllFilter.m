
clear all;
close all;
% import data from file
x = importdata('fx_origin_27075.txt');
n = size(x);
%===========  use matlab internal filter to evaluate move-average-filter
w=100;  %window size
b=ones(1,w)/w;
a=1;
y1=filter(b,a,x);
%pre-set first w-size result with input
for i=1:w
    y1(i)=x(i);
end

%=========  self-write moving average filter   
y2=zeros(n);
for i=1:n
  y2(i)  = MovAvgFilter(x(i));
end

%====== LPF filter,0.9*y(n-1)+0.1*x
y3=zeros(n);
lpf = 0.9;
y3(1) = x(1);
for i=2:n
  y3(i)  = lpf*y3(i-1) + (1-lpf)*x(i);
end

%=========  first-order kalman filter   
y4=zeros(n);
for i=1:n
  y4(i)  = FirstOrderKalman(x(i));
end




plot(x);
hold on;
plot(y1,'Linewidth', 8);
hold on;
plot(y2,'Linewidth', 6);
hold on;
plot(y3,'Linewidth', 4);
hold on;
plot(y4,'Linewidth', 2);
legend('Input Data','Filtered100','MovAvg100','LPF','kalman1ord');

