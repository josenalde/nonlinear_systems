clc

x1a = sqrt(8/5); x2a = sqrt(3/5);
disp('equilibrium points: ')
x1a
x2a
A1 = [-2*x1a -8*x2a; -2*x1a 2*x2a];
disp('A1: ')
disp('trace: ')
trace(A1)
disp('det: ')
det(A1)
disp('eig: ')
eig(A1)


x1b = sqrt(8/5); x2b = -sqrt(3/5);
disp('equilibrium points: ')
x1b
x2b
A2 = [-2*x1b -8*x2b; -2*x1b 2*x2b];
disp('A2: ')
disp('trace: ')
trace(A2)
disp('det: ')
det(A2)
disp('eig: ')
eig(A2)

x1c = -sqrt(8/5); x2c = sqrt(3/5);
disp('equilibrium points: ')
x1c
x2c
A3 = [-2*x1c -8*x2c; -2*x1c 2*x2c];
disp('A3: ')
disp('trace: ')
trace(A3)
disp('det: ')
det(A3)
disp('eig: ')
eig(A3)

x1d = -sqrt(8/5); x2d = -sqrt(3/5);
disp('equilibrium points: ')
x1d
x2d
A4 = [-2*x1d -8*x2d; -2*x1d 2*x2d];
disp('A4: ')
disp('trace: ')
trace(A4)
disp('det: ')
det(A4)
disp('eig: ')
eig(A4)
