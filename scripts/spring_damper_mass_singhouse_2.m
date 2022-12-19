clear all; clc;

%singhouse2000_system 2
m1 = 5; m2 = 2; k1 = 100; k2 = 78.96; b = 10;

A = [0 0 1 0; 0 0 0 1; -(k1+k2)/m1 k2/m1 -b/m1 0; k2/m2 -k2/m2 0 0];
B = [0; 0; 1/m1; 0];

x_0 = [0; 2; 0; 0];
x_i = x_0; %para plot do ponto inicial

h = 0.01;

k = 1;

tMax = 25;

nSamples = tMax/h;
t = zeros(1, round(nSamples));

u = 0;

while ( k <= nSamples)

   x_dot = A*x_0 + B*u;
   x = x_0 + h*x_dot;
   x_0 = x;
   x_1(k) = x(1);
   x_2(k) = x(2);
   x_3(k) = x(3);
   x_4(k) = x(4);
   k = k + 1;
   t(k) = t(k-1) + h;
end

subplot(2,1,1);
plot(t(1:end-1), x_1, 'k-', 'LineWidth', 3);
title('Spring Damper System (disturbed) Singhouse2000')
grid on;
xlabel('time (s)');
ylabel('position');
hold on;
plot(t(1:end-1), x_2, 'b-', 'LineWidth', 3);
legend ("x_1(t)", "x_2(t)");


subplot(2,1,2);
plot(t(1:end-1), x_3, 'k-', 'LineWidth', 3);
hold on;
plot(t(1:end-1), x_4, 'b-', 'LineWidth', 3);
grid on;
xlabel('time (s)');
ylabel('position');
legend ("\dot{x}_1(t)", "\dot{x}_2(t)");
