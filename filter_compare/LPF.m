function output = LPF(x)
%
%
persistent lastx Init


if isempty(Init)
  lastx = x;
  
  Init = 1;  
end


alpha = 0.9;
output = alpha*lastx + (1 - alpha)*x;

lastx = output;