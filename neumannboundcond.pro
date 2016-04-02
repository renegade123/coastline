;completed 2016.1.21
FUNCTION NeumannBoundCond,f
  size = SIZE(f);
  nrow=size[1]
  ncol=size[2]
  g = f;
  ;g[[0,nrow-1],[0,ncol-1]] = g([2,nrow-3],[2,ncol-3]);
  g[0,0]=g[2,2]
  g[0,ncol-1]=g[2,ncol-3]
  g[nrow-1,0]=g[nrow-3,2]
  g[nrow-1,ncol-1]=g[nrow-3,ncol-3]
  ;g[[1,nrow-1],1:ncol-2] = g[[2,nrow-3],1:ncol-2]
  g[0,1:ncol-2] = g[2,1:ncol-2]
  g[nrow-1,1:ncol-2] = g[nrow-3,1:ncol-2]
  ;g[1:nrow-2,[0,ncol-1]] = g[1:nrow-2,[2, ncol-3]]
  g[1:nrow-2,0] = g[1:nrow-2,2]
  g[1:nrow-2,ncol-1] = g[1:nrow-2, ncol-3]
  RETURN,g
END