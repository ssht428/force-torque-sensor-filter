clear all

Nsamples = 6808;

Xsaved = zeros(Nsamples, 1);
Zsaved = zeros(Nsamples, 1);

for k=1:Nsamples
  h = GetAlt();
  volt = FirstOrderKalman(h);
  
  Xsaved(k) = volt;
  Zsaved(k) = h;
end

dt = 0.02;
t  = 0:dt:Nsamples*dt-dt;

figure
hold on
plot(t, Zsaved, 'r.');
plot(t, Xsaved, 'k');

legend('Measured', 'Kalman')
