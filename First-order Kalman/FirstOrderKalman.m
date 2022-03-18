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

% ϵͳԤ�ⷽ��
xp = A*x;
% Э����Ԥ��
Pp = A*P*A' + Q;
% �������
K = Pp*H'*inv(H*Pp*H' + R);
% ״̬����
x = xp + K*(z - H*xp);
% Э�������
P = Pp - K*H*Pp;

Alt = x;