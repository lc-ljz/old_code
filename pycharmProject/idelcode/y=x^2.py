import numpy as np
x=np.linspace(0,2,101)
y=np.power(x,2)

import matplotlib.pyplot as plt
plt.plot(x,y)
plt.legend(['y=x^2'])
plt.show()
