x=[-4:.04:4];
y=x;
[X,Y] = meshgrid(x,y);
V1 = X.^2 + X.*Y + Y.^2 + X .* Y.^3;
%surfc(X,Y,V1);

x=[-1:.04:1];
y=x;
[X,Y] = meshgrid(x,y);
V2 = X.^2 ./ (1 + X.^2) + Y.^2;
#urfc(X,Y,V2);


x=[-1:.04:1];
y=x;
[X,Y] = meshgrid(x,y);
V2 = X.^2 ./ (1 + X.^2) + Y.^2;
%surfc(X,Y,V2);


x=[-4:.04:4];
y=x;
[X,Y] = meshgrid(x,y);
V3 = (X - Y).^2;
%surfc(X,Y,V3);

x=[-2:.04:2];
y=x;
[X,Y] = meshgrid(x,y);
V4 = (((X + Y).^2) ./ (1 + X.^2 + Y.^2)) + (X - Y).^2;
%surfc(X,Y,V4);

x=[-1.1:.04:1.1];
y=x;
[X,Y] = meshgrid(x,y);
V5 = (X+Y.^2).^2 + Y.^2;
surfc(X,Y,V5);
