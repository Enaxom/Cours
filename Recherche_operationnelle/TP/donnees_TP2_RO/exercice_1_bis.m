C = [-10000 -9000];
A = [0.06 0.05;10 20;1 0];
B = [60;15000;800];
Binf = [0;0];
Bsup = [Inf;Inf];

% Au premier appel de la fonction resolution, zmin vaut Inf :
[X,zmin] = resolution(C,A,B,Binf,Bsup,[0;0],Inf);

fprintf('\nLa solution vaut (%d,%d)\n',floor(X));
fprintf('La valeur maximale de l''objectif vaut %f\n\n',-zmin);
