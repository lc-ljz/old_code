import numpy as np
import matplotlib.pyplot as plt

#scalar multiplication:数乘运算

v=[1,2]
w=np.array([3,4])
v=np.array(v)
u=3*w+4*v
#print(u)

u2=np.dot(v,w)
u3=v[0]*w[0]+v[1]*w[1]
#print(u2)
#print(u3)

#Length:north
a=3
#print(a**3)
len_of_v=np.sqrt(v[0]**2+v[1]**2)
norm_of_v=np.sqrt(np.dot(v,v))
#print(len_of_v)
#print(norm_of_v)

#A=np.array([1,2],[3,4])
b=np.array([6,4])
#x=np.linearalg(A,b)
plt.quiver(0,0,1,1)
