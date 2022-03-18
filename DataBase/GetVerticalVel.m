function h = GetVerticalVel()

persistent VerticalVel k Init

if isempty(Init)
  load VerticalVel
  k = 1;
  Init = 1;
end
h = VerticalVel(k);
k = k + 1;
