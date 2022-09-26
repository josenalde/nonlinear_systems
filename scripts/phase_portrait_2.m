clear all; close all; clc

#@Josenalde Oliveira

#campo vetorial
#Exemplo 1: pêndulo não amortecido sem entrada externa

#y" + sin(y) = 0
#Fazendo x_1 = y e x_2 = y', tem-se x_1' = x_2 e x_2'=-sin(y)

#Função lambda sem atrito
#f_1 = @(t,X) [X(2); -sin(X(1))];

#Função lambda comet atrito
f_3 = @(t,X) [X(2); -sin(X(1)) - 0.5*X(2)]; #g=l=10,m=1,B=0.5

f_4 = @(t,X) [X(2); -2*X(1) - X(1)^2 - 0.5*X(2)];

#Exemplo 2: VAN DER POL
#mx" + 2c(x^2-1)x' + kx=0
m=1; c=0.1; k=1; #testar para c variando 0.1, 0.2, 0.5, 1.0, 1.5, 2.0
f_2 = @(t, X) [X(2); (1/m)*(-2*c*(X(1)^2-1)*X(2)-k*X(1))];

#Vamos definir o intervalo em x_1 e x_2 de interesse
x_1_min = -5; #-2,8,-2,2
x_1_max = 5;
x_2_min = -5;
x_2_max = 5;

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
    #Xprime = f_4(t,[x(i); x_dot(i)]);
    u(i) = Xprime(1);
    v(i) = Xprime(2);
end

quiver(x,x_dot,u,v,'b', 'LineWidth', 1);
hold on;
xlabel('x_1');
ylabel('x_2');
axis tight equal;
set(gca, 'Fontsize', 20);

#Algumas trajetórias

#for x_2_0 = [1]
#for x_2_0 = [0.5 1 1.5 2.5 4.5]
while true
    [x0_x, x0_y] = ginput(1);
    x0 = [x0_x, x0_y];
    tspan=[0 60];
    [ts,xs] = ode45(f_2,tspan, x0);
    plot(xs(:,1),xs(:,2), 'LineWidth', 3);
    plot(xs(1,1),xs(1,2),'bo') % starting point
    plot(xs(end,1),xs(end,2),'ks') % ending point
end
hold off



