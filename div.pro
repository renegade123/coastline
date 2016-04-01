FUNCTION div,nx,ny
  nxGrad=gradient(nx,/vector)
  nxx=nxGrad[*,*,0]
  junk=nxGrad[*,*,1]
  nyGrad=gradient(ny,/vector)
  junk=nyGrad[*,*,0]
  nyy=nyGrad[*,*,1]
  f=nxx+nyy
  RETURN,f
END