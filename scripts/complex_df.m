a =1;
b=1;

z1 = a + b*i; #Seja a fase de N(X) = 45
z1
phase_1 = atan(imag(z1)/real(z1));
ang1=(phase_1*180)/pi

z2 = a/(a^2+b^2) + (-b/(a^2+b^2))*i; % 1/z1 equivale 1/N(X)
disp("Seja z2 o inverso de z1... equivale a 1/N(X)");
z2
phase_2 = atan(imag(z2)/real(z2));
ang2=(phase_2*180)/pi # -45

z3 = -z2; # -(1/N(X))
phase_3 = atan(imag(z3)/real(z3));
ang3=(phase_3*180)/pi # -45 (ou seja não retorna, pois a relação continua -1)
%%%%%%% com angulo inicial negativo %%%%%%%%%

a =1;
b=-1;

z1 = a + b*i; #Seja a fase de N(X) = -45
z1
phase_1 = atan(imag(z1)/real(z1));
ang1=(phase_1*180)/pi

z2 = a/(a^2+b^2) + (-b/(a^2+b^2))*i; % 1/z1 equivale 1/N(X)
disp("Seja z2 o inverso de z1... equivale a 1/N(X)");
z2
phase_2 = atan(imag(z2)/real(z2));
ang2=(phase_2*180)/pi # 45

z3 = -z2; # -(1/N(X))
phase_3 = atan(imag(z3)/real(z3));
ang3=(phase_3*180)/pi # 45


