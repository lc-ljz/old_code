import numpy as np
x=np.linspace(0,2,101)
y1=np.sqrt(x)
y2=np.log(x+1)

import matplotlib.pyplot as plt
l1,=plt.plot(x,y1)
l2,=plt.plot(x,y2)
plt.legend([l1,l2,],['sqrt(x)','log(x+1)'])
plt.show()
