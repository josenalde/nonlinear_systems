#https://docs.sympy.org/latest/guides/solving/solve-ode.html

from sympy import symbols, lambdify
import numpy as np
import scipy.integrate
import matplotlib.pyplot as plt
# Create symbols y0, y1, and y2
y = symbols('y:3')
kf, kb = symbols('kf kb')
rf = kf * y[0]**2 * y[1]
rb = kb * y[2]**2
# Derivative of the function y(t); values for the three chemical species
# for input values y, kf, and kb
ydot = [2*(rb - rf), rb - rf, 2*(rf - rb)]
t = symbols('t') # not used in this case
# Convert the SymPy symbolic expression for ydot into a form that
# SciPy can evaluate numerically, f
f = lambdify((t, y, kf, kb), ydot)
k_vals = np.array([0.42, 0.17]) # arbitrary in this case
y0 = [1, 1, 0] # initial condition (initial values)
t_eval = np.linspace(0, 10, 50) # evaluate integral from t = 0-10 for 50 points
# Call SciPy's ODE initial value problem solver solve_ivp by passing it
#   the function f,
#   the interval of integration,
#   the initial state, and
#   the arguments to pass to the function f
solution = scipy.integrate.solve_ivp(f, (0, 10), y0, t_eval=t_eval, args=k_vals)
# Extract the y (concentration) values from SciPy solution result
y = solution.y
# Plot the result graphically using matplotlib
plt.plot(t_eval, y.T) 
# Add title, legend, and axis labels to the plot
plt.title('Chemical Kinetics') 
plt.legend(['NO', 'Br$_2$', 'NOBr'], shadow=True) 
plt.xlabel('time') 
plt.ylabel('concentration') 
# Finally, display the annotated plot
plt.show()