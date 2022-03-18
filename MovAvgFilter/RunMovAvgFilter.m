
clear all

Nsamples = 6800;
Xsaved   = zeros(Nsamples, 1);
hsaved  = zeros(Nsamples, 1);


for k=1:Nsamples
  h = GetAlt();
  x  = MovAvgFilter(h);
  
  Xsaved(k)  = x;
  hsaved(k) = h;
end

% �ֳ���ӦNsamples�����ݵ�

dt = 0.02;
t  = 0:dt:Nsamples*dt-dt;

figure
hold on
plot(t, hsaved, 'r.');
plot(t, Xsaved, 'k');
legend('Measured', 'Moving average')
