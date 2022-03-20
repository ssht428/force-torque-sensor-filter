function [pos vel] = SecondOrderKalman(z)

persistent A H Q R 
persistent x P
persistent Init


if isempty(Init)
  Init = 1;
  % ���680s��dtѡ��0.1s���������dt����ʵ������ʣ����ռ���ĸ߶�ƫ���Ƚϴ�
  dt = 0.1;
  
  % ��Ԥ��״̬���̵õ�A���B��
  A = [ 1 dt;
        0 1  ];
 
 % �۲���� ���ڲ�״̬�����֮�������ӳ�䣬���� = ����� ���� = ����
  H = [0 1];
  
  % Q R�����Լ����ã�������Ԥ��ֵ���ǲ���ֵ
  Q = [ 1 0;
        0 3 ];
    
  R = 100;
  x = [ 0 z ]';
  P = 5*eye(2);
end
% ϵͳ����״̬Ԥ��
xp = A*x;
% ϵͳ����Э����Ԥ��
Pp = A*P*A' + Q;
% K��
K = Pp*H'*inv(H*Pp*H' + R);
% ����Ԥ��ֵ
x = xp + K*(z - H*xp);
% ����Э������
P = Pp - K*H*Pp;   

% �õ��������
pos = x(1);
vel = x(2);