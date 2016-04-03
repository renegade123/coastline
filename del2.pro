  function del2,f
    sz = size( f )
    nx=sz[1] & ny=sz[2]
    L=dindgen(nx,ny,/TPOOL_MIN_ELTS)
    for i=1,nx-2 do begin
      for j=1,ny-2 do begin
        L[i,j]=(f[i+1,j]+f[i-1,j]+f[i,j+1]+f[i,j-1])/4-f[i,j]
      endfor
    endfor
    L[0,*]=0
    L[*,0]=0
    L[nx-1,*]=0
    L[*,ny-1]=0
;    L[0,0]=(f[2,0]+f[0,2]+2*f[0,0])/4-(f[1,0]+f[0,1])/2;���Ͻ�
;    L[nx-1,0]=(f[nx-3,0]+f[nx-1,2]+2*f[nx-1,0])/4-(f[nx-2,0]+f[nx-1,1])/2;���½�
;    L[0,ny-1]=(f[0,ny-3]+f[2,ny-1]+2*f[0,ny-1])/4-(f[0,ny-2]+f[1,ny-1])/2;���Ͻ�
;    L[nx-1,ny-1]=(f[nx-3,ny-1]+f[nx-1,ny-3]+2*f[nx-1,ny-1])/4-(f[nx-2,ny-1]+f[nx-1,ny-2])/2;���½�
;    for j=1,ny-2 do begin
;        L[0,j]=(f[0,j+1]+f[0,j-1]+f[2,j]+f[0,j])/4-(f[0,j]+f[1,j])/2
;    endfor
;    FOR j=1,ny-2 DO BEGIN
;      L[nx-1,j]=(f[nx-1,j+1]+f[nx-1,j-1]+f[nx-3,j]+f[nx-1,j])/4-(f[nx-1,j]+f[nx-2,j])/2
;    ENDFOR
;    FOR j=1,nx-2 DO BEGIN
;      L[j,0]=(f[j+1,0]+f[j-1,0]+f[j,2]+f[j,0])/4-(f[j,0]+f[j,1])/2
;    ENDFOR
;    FOR j=1,nx-2 DO BEGIN
;      L[j,ny-1]=(f[j+1,ny-1]+f[j-1,ny-1]+f[j,ny-3]+f[j,ny-1])/4-(f[j,ny-1]+f[j,ny-2])/2
;    ENDFOR
    return,L
  end