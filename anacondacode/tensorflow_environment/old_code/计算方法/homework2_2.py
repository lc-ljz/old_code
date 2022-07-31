
#幂函数，指数，阶乘
import math
import numpy as np
import matplotlib.pyplot as plt

N=6
#n=1:N
n=np.linspace(1,N)
x1=np.power(n,2)
x2=np.power(2,n)

x3=[]
for i in range(1,N+1):
    x3.append(math.factorial(i))


plt.plot(n,x1,'r')
plt.plot(n,x2,'k')
plt.plot(x3,'b')
