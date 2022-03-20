
function xm = MovAvgFilter(x)
%

persistent n windows
persistent Init

% 初始化为100点窗口滑动平均滤波
if isempty(Init) 
  n = 100;
  windows = x*ones(n, 1);
  Init = 1; 
end

% 前面n-1个移位，最后面一个总是更新
for m=1:n-1
  windows(m) = windows(m+1);
end
windows(n) = x;

xm = sum(windows) / n;
