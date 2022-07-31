

#多项式(x-1)^14
#展开式系数
import numpy as np
import matplotlib.pylab as plt

c=[1,-14,91,-364,1001,-2002,3003,-3432,3003,-2002,1001,-364,91,-14,1]
x=np.linspace(0.99,1.01,101)

y1=(x-1)**14
x=np.transpose(x)
q=np.arange(14,-1,-1)

#z=x**q
#z=[]
#a=[]
#x1=np.transpose(x)
#for i in range(len(q)):
#    z.append(x**q[i])
#z=np.transpose(z)
#print(z)

#v=np.transpose(c)
#yy=z*v

plt.plot(x,y1)
plt.figure()
#plt.plot(x,yy)
#秦久韶算法n
p=c[0]
for i in range(1,len(c)):
    p=x*p+c[i]

plt.plot(x,p)
