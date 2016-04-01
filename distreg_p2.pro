FUNCTION distReg_p2,phi
  phiGrad=gradient(phi,/vector)
  phi_x=phiGrad[*,*,0]
  phi_y=phiGrad[*,*,1]
  s=SQRT(phi_x^2 + phi_y^2);
  sz = size( phi )
  nx=sz[1] & ny=sz[2]

  m = (s GE 0) 
  n = (s LE 1)
  a = logical_and(m,n)
  b=(s GT 1)

  ps=a*SIN(2*!pi*s)/(2*!pi)+b*(s-1);  compute first order derivative of the double-well potential p2 in eqaution (16)
  dps=((ps ne 0)*ps+(ps eq 0))/((s ne 0)*s+(s eq 0));  compute d_p(s)=p'(s)/s in equation (10). As s-->0, we have d_p(s)-->1 according to equation (18)
  f = div(dps*phi_x - phi_x, dps*phi_y - phi_y) + 4*del2(phi)
  RETURN,f
END