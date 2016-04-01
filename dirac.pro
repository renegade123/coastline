FUNCTION Dirac,x,sigma
  f=(0.5/sigma)*(1+COS(!PI*x/sigma));
  m = (x le sigma)
  n = (x ge -sigma)
  b =  logical_and(m,n)
  res = f*b;
  return,res
END