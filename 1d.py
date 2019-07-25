#!/usr/bin/env python3
import numpy as np
import time
import matplotlib.pyplot as plt
from matplotlib import animation

arry = [0. for _ in range(101)]
arrx = [i for i in range(101)]
arry[50] = 1.
s = np.array(arrx)
start = np.array(arry)

fig = plt.figure()
ax = plt.axes(xlim=(0, 101), ylim=(0, 1))
line, = ax.plot([], [], lw=2)

def init():
   line.set_data([], [])
   return line,

def animate(i):
    global start
    start = step(start, 0.1)
    line.set_data(s, start)
    return line,

def step(state, L):
    n = len(state)
    state[1:-2] = state[1:-2] + L*(state[0:-3] - 2 * state[1:-2] + state[2:-1])
    return state

anim = animation.FuncAnimation(fig, animate, init_func=init,
                                       frames=100, interval=20, blit=True)

anim.save('basic_animation.mp4', fps=30, extra_args=['-vcodec', 'libx264'])

plt.show()
