clc;

a11 = -2; a12 = 1; a21 = 1; a22 = -2;

A = [a11 a12; a21 a22];

# caso 1: s1, s2 reais, negativos, distintos DELTA > 0, TR<0, NÓ ESTÁVEL
s1 = -1; s2 = -3;
printf("Traço A: %.2f\n", trace(A));
printf("Det A: %.2f\n", det(A));

# autovetores

v11 = 1; v12 = (s1 - a11) / (a12);
v1 = [v11; v12]
v1

v21 = 1; v22 = (s2 - a11) / (a12);
v2 = [v21; v22]
v2

# autovalores
s = eig(A);
s1 = s(1);
s2 = s(2);

# transformação

printf("A*v1: %.2f\n", A*v1);
printf("s1*v1: %.2f\n", s1*v1);

printf("A*v2: %.2f\n", A*v2);
printf("s2*v2: %.2f\n", s2*v2);

h = quiver(0, 0, v1(1), v1(2), 0 ,'b', 'linewidth', 2);
set(gca, "linewidth", 3, "fontsize", 16);
xlim([-3 3]);ylim([-3 3]); grid on;
title('Caso NÓ ESTÁVEL, 2 autovalores reais negativos distintos');
xlabel('s1=-3,azul; s2=-1,vermelho');
hold on
set (h, "maxheadsize", 0.033);
h = quiver(0, 0, v2(1), v2(2), 0 ,'r', 'linewidth', 2);
hold on
set (h, "maxheadsize", 0.033);

h = quiver(0, 0, s1*v1(1), s1*v1(2), 0 ,'b--', 'linewidth', 2);
xlim([-3 3]);ylim([-3 3]); grid on;
hold on
set (h, "maxheadsize", 0.033);
h = quiver(0, 0, s2*v2(1), s2*v2(2), 0 ,'r--', 'linewidth', 2);
hold on
set (h, "maxheadsize", 0.033);

#################### CASO NÓ INSTÁVEL #################


# caso 1: s1, s2 reais, positivos, distintos DELTA > 0, TR>0, NÓ INSTÁVEL
s1 = 1; s2 = 3;
s1
s2

printf("Traço A: %.2f\n", trace(A));
printf("Det A: %.2f\n", det(A));

# autovetores

v11 = 1; v12 = 1;
v1 = [v11; v12]
v1

v21 = 1; v22 = -1;
v2 = [v21; v22]
v2

figure;
h = quiver(0, 0, v1(1), v1(2), 0 ,'b', 'linewidth', 2);
set(gca, "linewidth", 3, "fontsize", 16);
xlim([-3 3]);ylim([-3 3]); grid on;
title('Caso NÓ INSTÁVEL, 2 autovalores reais positivos distintos');
xlabel('s1=1,azul; s2=3,vermelho');
hold on
set (h, "maxheadsize", 0.033);
h = quiver(0, 0, v2(1), v2(2), 0 ,'r', 'linewidth', 2);
hold on
set (h, "maxheadsize", 0.033);

h = quiver(0, 0, s1*v1(1), s1*v1(2), 0 ,'b--', 'linewidth', 2);
xlim([-3 3]);ylim([-3 3]); grid on;
hold on
set (h, "maxheadsize", 0.033);
h = quiver(0, 0, s2*v2(1), s2*v2(2), 0 ,'r--', 'linewidth', 2);
hold on
set (h, "maxheadsize", 0.033);

#################### CASO PONTO DE SELA #################


# caso 1: s1, s2 reais, distintos, sinais opostos DELTA < 0, TR<, > ou = 0
s1 = 1; s2 = -3;
s1
s2

printf("Traço A: %.2f\n", trace(A));
printf("Det A: %.2f\n", det(A));

# autovetores

v11 = 1; v12 = 1;
v1 = [v11; v12]
v1

v21 = 1; v22 = -1;
v2 = [v21; v22]
v2

figure;
h = quiver(0, 0, v1(1), v1(2), 0 ,'b', 'linewidth', 2);
set(gca, "linewidth", 3, "fontsize", 16);
xlim([-3 3]);ylim([-3 3]); grid on;
title('Caso PONTO DE SELA, 2 autovalores reais distintos com sinais opostos');
xlabel('s1=1,azul; s2=3,vermelho');
hold on
set (h, "maxheadsize", 0.033);
h = quiver(0, 0, v2(1), v2(2), 0 ,'r', 'linewidth', 2);
hold on
set (h, "maxheadsize", 0.033);

h = quiver(0, 0, s1*v1(1), s1*v1(2), 0 ,'b--', 'linewidth', 2);
xlim([-3 3]);ylim([-3 3]); grid on;
hold on
set (h, "maxheadsize", 0.033);
h = quiver(0, 0, s2*v2(1), s2*v2(2), 0 ,'r--', 'linewidth', 2);
hold on
set (h, "maxheadsize", 0.033);


