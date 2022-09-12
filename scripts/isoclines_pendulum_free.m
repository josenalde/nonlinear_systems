x_1 = [-3.5:0.1:3.5];
x_2_a = -sin(x_1); #inclinações positivas
x_2_b = -2*sin(x_1);
x_2_c = -3*sin(x_1);
x_2_d = -4*sin(x_1);
x_2_e = sin(x_1); #inclinações negativas
x_2_f = 2*sin(x_1);
x_2_g = 3*sin(x_1);
x_2_h = 4*sin(x_1);


plot(x_1,x_2_a, 'b-');
hold on;
plot(0,0,'ro');
plot(x_1,x_2_b, 'b-');
plot(x_1,x_2_c, 'b-');
plot(x_1,x_2_d, 'b-');
plot(x_1,x_2_e, 'r-');
plot(x_1,x_2_f, 'r-');
plot(x_1,x_2_g, 'r-');
plot(x_1,x_2_h, 'r-');
title('Isóclinas Pêndulo Simples Sem Atrito');
xlabel('x_1');
ylabel('x_2');
grid on;
hold off;
