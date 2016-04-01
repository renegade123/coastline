FUNCTION drlse_edge,phi, g, lambda,mu, alfa, epsilon, timestep, iter, potentialFunction
  phi=phi
  grad_g=gradient(g,/vector)
  vx=grad_g[*,*,0]
  vy=grad_g[*,*,1]
  FOR k=1,iter DO BEGIN
    phi=NeumannBoundCond(phi)
    ;todo:ÇóÌÝ¶Èphi_x,phi_y
    grad_phi=gradient(phi,/vector)
    phi_x=grad_phi[*,*,0]
    phi_y=grad_phi[*,*,1]
    s=SQRT(phi_x^2 + phi_y^2)
    smallNumber=1e-10
    Nx=phi_x/(s+smallNumber)
    Ny=phi_y/(s+smallNumber)
    curvature=div(Nx,Ny);
    IF STRCMP(potentialFunction,'single-well') THEN BEGIN
      distRegTerm = 4*del2(phi)-curvature
    ENDIF ELSE BEGIN
      IF  STRCMP(potentialFunction,'double-well') THEN distRegTerm=distReg_p2(phi) ELSE PRINT,'Error: Wrong choice'
    END
    diracPhi=Dirac(phi,epsilon)
    areaTerm=diracPhi*g
    edgeTerm=diracPhi*(vx*Nx+vy*Ny) + diracPhi*g*curvature
    phi=phi + timestep*(mu*distRegTerm + lambda*edgeTerm + alfa*areaTerm)
  ENDFOR
  RETURN,phi
END
