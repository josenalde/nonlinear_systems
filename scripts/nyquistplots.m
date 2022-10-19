n = 40;
d = poly([2 -10]);
sys = tf(n,d);
nyquist(sys);

set(gca, 'FontSize', 18);
axis('equal');
hold on;

n = 20;
sys=tf(n,d);
nyquist(sys);

n = 10;
sys=tf(n,d);
nyquist(sys);
hold off;
