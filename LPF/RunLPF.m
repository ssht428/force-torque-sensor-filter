clear all

Nsamples = 6800;
Xsaved   = zeros(Nsamples, 1);
Xmsaved  = zeros(Nsamples, 1);


for k=1:Nsamples
  xm = GetAlt();
  x  = LPF(xm);
  
  Xsaved(k)  = x;
  Xmsaved(k) = xm;
end


dt = 0.02;
t  = 0:dt:Nsamples*dt-dt;

figure
hold on
plot(t, Xmsaved, 'r.');
plot(t, Xsaved, 'b');
legend('Measured', 'LPF')
