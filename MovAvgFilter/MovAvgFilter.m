
function xm = MovAvgFilter(x)
%

persistent n windows
persistent Init

% ��ʼ��Ϊ10�㴰�ڻ���ƽ���˲�
if isempty(Init) 
  n = 10;
  windows = x*ones(n, 1);
  Init = 1; 
end

% ǰ��n-1����λ�������һ�����Ǹ���
for m=1:n-1
  windows(m) = windows(m+1);
end
windows(n) = x;

xm = sum(windows) / n;
