import matplotlib.pyplot as plt
import scipy.stats as st
from math import sqrt
import numpy as np

size = [10, 50, 100]

'''
# --------- Нормальноре распределенеие ------------
name = 'Нормальное распределенеие'
distr = st.norm(loc=0, scale=1)
# -------------------------------------------------
'''
'''
# --------- Распределение Коши ------------
name = 'Распределение Коши'
distr = st.cauchy()
# -----------------------------------------
'''
'''
# --------- Распределение Лапласа ------------
name = 'Распределение Лапласа'
distr = st.laplace(loc=0, scale=sqrt(2))
# --------------------------------------------
'''

# --------- Равномерное распределение ------------
name = 'Равномерное распределение'
distr = st.uniform(loc=-sqrt(3), scale=sqrt(3))
# -------------------------------------------------

# GRAPHICS

plt.figure(1, figsize=(9, 3))
for i in range(3):
    n_plot = 131 + i
    plt.subplot(n_plot)
    x = np.linspace(distr.ppf(0.01), distr.ppf(0.99), size[i])
    plt.plot(x, distr.pdf(x), 'r-', lw=3, label='theory')
    r = distr.rvs(size=size[i])
    plt.hist(r, density=True, histtype='stepfilled', alpha=0.5, label='range = ' + str(size[i]))
    plt.legend(loc='best')
    plt.grid(True)
plt.suptitle(name)
plt.show()


'''
# --------- Распределение Пуассона ------------
name = 'Распределение Пуассона'
mu = 7
distr = st.poisson
# ---------------------------------------------


plt.figure(1, figsize=(9, 3))
for i in range(3):
    n_plot = 131 + i
    plt.subplot(n_plot)
    x = np.arange(distr.ppf(0.01, mu), distr.ppf(0.99, mu))
    plt.plot(x, distr.pmf(x, mu), 'bo', ms=8, label='theory')
    plt.vlines(x, 0, distr.pmf(x, mu), colors='b', lw=5, alpha=0.5)
    r = distr.rvs(mu, size=size[i])
    plt.hist(r, density=True, histtype='stepfilled', alpha=0.5, label='range = ' + str(size[i]))
    plt.legend(loc='best')
    plt.grid(True)
plt.suptitle(name)
plt.show()
'''