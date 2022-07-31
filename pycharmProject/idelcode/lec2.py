import numpy as np

u=np.array([1,2])
v=np.array([-2,1])
t=np.arange(-5,5,0.5)
c,d=np.meshgrid(t,t)
U=c*u[0]+d*v[0]
V=c*u[1]+d*v[1]
U=np.reshape(U,[-1,1])
V=np.reshape(V,[-1,1])
