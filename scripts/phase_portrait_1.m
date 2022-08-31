clear all; close all; clc

#@Josenalde Oliveira

#campo vetorial
#Exemplo 1: pêndulo não amortecido sem entrada externa

#y" + sin(y) = 0
#Fazendo x_1 = y e x_2 = y', tem-se x_1' = x_2 e x_2'=-sin(y)

#Função lambda
f_1 = @(t,X) [X(2); -sin(X(1))];

#Exemplo 2: VAN DER POL
#mx" + 2c(x^2-1)x' + kx=0
m=1; c=0.3; k=1; #testar para c variando 0.1, 0.2, 0.5, 1.0, 1.5, 2.0
f_2 = @(t, X) [X(2); (1/m)*(-2*c*(X(1)^2-1)*X(2)-k*X(1))];

#Vamos definir o intervalo em x_1 e x_2 de interesse
x_1_min = -3; #-2,8,-2,2
x_1_max = 3;
x_2_min = -4;
x_2_max = 4;

#cria eixos
x_1 = linspace(x_1_min, x_1_max, 20);
x_2 = linspace(x_2_min, x_2_max, 20);

#cria grid 20x20
[x,x_dot] = meshgrid(x_1,x_2);

u = zeros(size(x)); #guardará o valor de dot_x1 em cada ponto e v guardará o valor de dot_x2 em cada ponto
v = zeros(size(x));

t=0;
for i = 1:numel(x)
    Xprime = f_2(t,[x(i); x_dot(i)]);
    #Xprime = f_1(t,[x(i); x_dot(i)]);
    u(i) = Xprime(1);
    v(i) = Xprime(2);
end

quiver(x,x_dot,u,v,'r'); figure(gcf)
xlabel('x_1')
ylabel('x_2')
axis tight equal;

#Algumas trajetórias
hold on
for x_2_0 = [0 0.5 1 1.5 2 2.5]
    [ts,xs] = ode45(f_2,[0,50],[0;x_2_0]);
    plot(xs(:,1),xs(:,2))
    plot(xs(1,1),xs(1,2),'bo') % starting point
    plot(xs(end,1),xs(end,2),'ks') % ending point
end
hold off



