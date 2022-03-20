function [pos vel] = SecondOrderKalman(z)

persistent A H Q R 
persistent x P
persistent Init


if isempty(Init)
  Init = 1;
  % 大概680s，dt选择0.1s，由于这个dt不是实际输入故，最终计算的高度偏差会比较大。
  dt = 0.1;
  
  % 由预测状态方程得到A阵和B阵
  A = [ 1 dt;
        0 1  ];
 
 % 观测矩阵 是内部状态和输出之间的线性映射，列数 = 输出， 输入 = 函数
  H = [0 1];
  
  % Q R这里自己设置，看相信预测值还是测量值
  Q = [ 1 0;
        0 3 ];
    
  R = 100;
  x = [ 0 z ]';
  P = 5*eye(2);
end
% 系统二阶状态预测
xp = A*x;
% 系统二阶协方差预测
Pp = A*P*A' + Q;
% K阵
K = Pp*H'*inv(H*Pp*H' + R);
% 更新预测值
x = xp + K*(z - H*xp);
% 更新协方差阵
P = Pp - K*H*Pp;   

% 得到函数输出
pos = x(1);
vel = x(2);