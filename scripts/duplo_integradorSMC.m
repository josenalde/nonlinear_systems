% Script didatico Controle Duplo Integrador com Modos Deslizantes
% Autor: Josenalde Oliveira - Nov/2013 - PosDoc UTAD - Portugal

clear all;

A = [0 1;0 0];
B = [0;1];
C = [1 0;0 1];
u = -1;
h = 1e-2;

FLAGShowControl = 1;

Xa = [0.6;0.5];


k = 1;
t = 0;
tMax = 100;

disturbance = 0;
tiD=0;
tfD=0;

c = 1;

X1p = -1:h:1;
X2p = -c.*X1p;

while (t < tMax)

    Xponto = A*Xa + B*u;
    X = Xa + h*Xponto;
    y = C*X;

    % Superficie Deslizante

    S = c*y(1) + y(2);

    % Sinal de Controlo

    u = -sign(S);

    if (t >= tiD & t <= tfD)
       u = u + disturbance;
    end

    uplot(k) = u;

    % Grava para Plotagem
    X1(k) = y(1); % Posicao
    X2(k) = y(2); % Velocidade


    % Plotagem dos graficos

    if FLAGShowControl == 1
       title('SMC Double Integrator'); xlabel('Position'); ylabel('Velocity');
       subplot(2,1,1);
       text(0,0,'X');
       plot(X1p, X2p, 'b-', 'LineWidth', 2);
       hold on;
       plot(X1,X2, 'r', 'LineWidth', 2);
       grid on;
       subplot(2,1,2);
       plot(uplot, 'k', 'LineWidth', 1); xlabel('Time'); ylabel('u');title('Control Signal');
       hold on;
       grid on;
       M(k) = getframe;
    elseif FLAGShowControl == 0
       title('SMC Double Integrator'); xlabel('Position'); ylabel('Velocity');
       text(0,0,'X');
       plot(X1p, X2p, 'b-', 'LineWidth', 2);
       hold on;
       plot(X1,X2, 'r', 'LineWidth', 2);
       grid on;
       M(k) = getframe;
    end

    clc;
    fprintf('Time: %f', t);

    % Atualizacoes
    Xa = X;
    k = k + 1;
    t = t + h;

end

Movie(M,2);
