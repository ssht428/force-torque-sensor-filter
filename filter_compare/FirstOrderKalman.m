function Alt = FirstOrderKalman(z)
%
persistent A H Q R 
persistent x P
persistent Init

if isempty(Init)
  A = 1;
  H = 1;
  
  Q = 0.03;
  R = 4;

  x = z;
  P =  1;
  
  Init = 1;  
end

% 系统预测方程
xp = A*x;
% 协方差预测
Pp = A*P*A' + Q;
% 增益更新
K = Pp*H'*inv(H*Pp*H' + R);
% 状态更新
x = xp + K*(z - H*xp);
% 协方差更新
P = Pp - K*H*Pp;

Alt = x;