x1_0 = 0;
x2_0 = 0;
#X_0 = zeros(2,1);
X_0 = [x1_0; x2_0];

sp = 1;

a = 2;
b = 10;
A = [0 1; -a*b -(a+b)];
B = [0;1];
C = [1 0];

t = 0;
t_max = 25;

k = 1;
t_plot(k) = t;
y_plot(k) = X_0(1);

h = 0.1;

#PI
k_p = 0.5; #5 unstable
k_i = a*k_p;

i_0 = 0;

u = 0;
u_plot(1) = u;

alpha = 10;

i_max = 10;
u_max = 10;

while (t <= t_max)
  X_dot = A*X_0 + B*u;
  X_f = X_0 + h*X_dot;
  y = C*X_f;

  e_o = sp - y;

  p_l = k_p*e_o;
  p_nl = k_p*(e_o + alpha*(e_o^5));
  i = i_0 + k_i*e_o;
  if (i > i_max)
    i = i_max;
  endif
  # linear
  u = p_l + i; #r
  # nonlinear
  #u = p_nl + i; #b

  if (u > u_max)
    u = u_max;
  endif
  X_0 = X_f;
  i_0 = i;
  t = t + h;
  k = k + 1;
  t_plot(k) = t;
  y_plot(k) = y;
  u_plot(k) = u;
endwhile

subplot(2,1,1);
plot(t_plot, y_plot, 'r');
title('Linear system with linear and nonlinear PI, kp=0.4');
xlabel('Time (s)');
ylabel('Output');
grid on;
hold on;
subplot(2,1,2);
plot(t_plot, u_plot, 'r');
xlabel('Time (s)');
ylabel('Control signal');
grid on;
hold on;
