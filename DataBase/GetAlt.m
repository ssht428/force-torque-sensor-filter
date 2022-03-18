function h = GetAlt()

persistent BaroAlt       % BaroAlt.mat
persistent k Init

if isempty(Init)
  load BaroAlt
  k = 1;
  Init = 1;
end
h = BaroAlt(k);
k = k + 1;
