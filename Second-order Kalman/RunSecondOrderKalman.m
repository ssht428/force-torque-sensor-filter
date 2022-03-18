clear all

Nsamples = 6800;
% 大概680s，dt选择0.1s，由于这个dt不是实际输入故，最终计算的高度偏差会比较大。
dt = 0.1;
t  = 0:dt:Nsamples*dt-dt;
% Nsample行 3列 矩阵用来保存数据
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