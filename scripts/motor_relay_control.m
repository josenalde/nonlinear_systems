clear all; clc;

pkg load control
pkg load signal

K = 1;
T = 1.0; %2
a = 0.5; %0.3

M = 1; %amplitude relé
n = K;
d = [a*T^2 (T+a*T) 1 0];

#t = 0:0.1:200;
gs = tf(n,d);

A = [0 1 0; 0 0 1; 0 (-1/(a*T^2)) (-(T+a*T)/(a*T^2))];
B = [0;0;1/(a*T^2)];
C = [1;0;0];
D=0;

x_0 = [1; 0; 0];
x_i = x_0; %para plot do ponto inicial

h = 0.1;

k = 1;

tMax = 100;

nSamples = tMax/h;

Delta = 0; %no caso de testar zona morta

while ( k < nSamples)
   s = -x_0(1); #x = -y
   if (s > Delta)
     u = M;
   elseif (s < -Delta)
     u = -M;
   %elseif (s = 0)
   else
     u = 0;
   endif
   x_dot = A*x_0 + B*u;
   x = x_0 + h*x_dot;
   x_0 = x;
   x_1(k) = x(1);
   x_2(k) = x(2);
   x_3(k) = x(3);
   u_plot(k) = u;
   k = k + 1;
end

   subplot(4,2,1);
   #figure();
   plot(u_plot);
   title('Sinal de controle relé');

   subplot(4,2,2);
   #figure();
   plot(x_1, x_2, 'k-', 'LineWidth', 3);
   hold on;
   plot(x_i(1), x_i(2), 'bo', 'LineWidth', 3);
   grid on;
   title('Plano de fase');
   #figure();
   subplot(4,2,3);
   nyquist(gs);
   #figure();
   #plot(x_1, 'k-', 'LineWidth', 3);
   #hold on;

   k1 = K;
   k2 = 1/T;
   k3 = 1/(a*T);

   freq_ciclo = sqrt(k2*k3);

   re = re_gjw(k1, k2, k3, freq_ciclo);

   acl = (-re*4*M)/pi;
   t = 0:0.1:100;
   cl = acl*sin(freq_ciclo*t);
   subplot(4,2,4);
   plot(cl, 'b', 'LineWidth', 3);
   title('Ciclo Limite existente no sistema');

   printf("Frequencia Ciclo Limite: %f (rad/s)\n", freq_ciclo);
   printf('Re(G(jw)) = %f\n', re);
   printf("Amplitude X do Ciclo Limite: %f\n", acl);



