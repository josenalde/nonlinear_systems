clear all; clc;

A = [0 1; 0 0];
b = [0; 1];

x_0 = [-5; 0];
x_i = x_0; %para plot do ponto inicial

x_s = -abs(x_0(1)):abs(x_0(1));
s_plot = -2*x_s;

h = 0.1;

k = 1;

tMax = 100;

nSamples = tMax/h;

while ( k < nSamples)
   s = -x_0(2) - 2*x_0(1);
   if (s > 0)
     u = 1;
   elseif (s < 0)
     u = -1;
   elseif (s = 0)
     u = 0;
   endif
   x_dot = A*x_0 + b*u;
   x = x_0 + h*x_dot;
   x_0 = x;
   x_1(k) = x(1);
   x_2(k) = x(2);
   k = k + 1;
end

plot(x_1, x_2, 'k-', 'LineWidth', 3);
hold on;
plot(x_s, s_plot, 'r--', 'LineWidth', 3);
hold on;
plot(x_i(1), x_i(2), 'bo', 'LineWidth', 3);
grid on;

