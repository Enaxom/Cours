C = -[8 5];
A = [1 1;9 5];
B = [6;45];
Binf = [0;0];
Bsup = [Inf;Inf];

% Au premier appel de la fonction resolution, zmin vaut Inf :
[X,zmin] = resolution(C,A,B,Binf,Bsup,[0;0],Inf);

fprintf('\nLa solution vaut (%d,%d)\n',floor(X));
fprintf('La valeur maximale de l''objectif vaut %f\n\n',-zmin);

% Solution vaut (5,0)
% Valeur max objectif 40