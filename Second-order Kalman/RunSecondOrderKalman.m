clear all

Nsamples = 6800;
% ���680s��dtѡ��0.1s���������dt����ʵ������ʣ����ռ���ĸ߶�ƫ���Ƚϴ�
dt = 0.1;
t  = 0:dt:Nsamples*dt-dt;
% Nsample�� 3�� ����������������
Xsaved = zeros(Nsamples, 3);

for k=1:Nsamples
  z = GetVerticalVel(); 
  [pos vel] = SecondOrderKalman(z);
  Xsaved(k, :) = [-pos vel z];
end

figure
hold on
plot(t, Xsaved(:, 1))
plot(t, Xsaved(:, 3), 'r.')
plot(t, Xsaved(:, 2), 'k')
legend('P', 'Measured', 'V')