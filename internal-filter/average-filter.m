% moving average filter:
% y(1)=(1/a)*x(1);
% y(2)=(1/a)*x(2)+(1/a)*x(1);
% ... ...
% y(a)=(1/a)*x(a)+(1/a)*x(a-1)+...+(1/a)*x(1);
% ... ...
% y(i)=(1/a)*x(i)+(1/a)*x(i-1)+...+(1/a)*x(i-a+1);
clear;
close all;
w=100;  %window size
b=ones(1,w)/w;
a=1;
%importdata 函数允许加载各种数据的不同格式的文件
fy=importdata('fy_8192_still.csv'); %读取csv数据文件
%fy=importdata('fx_origin_27075.txt');
rfy=round(fy);
y=filter(b,a,rfy);
for i=1:w
    y(i)=rfy(1);
end
w1=20;  %window size
b1=ones(1,w1)/w1;
y1=filter(b1,a,rfy);
for i=1:w1
    y1(i)=rfy(1);
end
%figure;hold on;plot(y,fy,'b.','markersize',20);axis equal; 
plot(fy);
hold on;
plot(y1,'Linewidth', 2);
hold on;
plot(y,'Linewidth', 4);

legend('Input Data','Filtered20','Filtered100');