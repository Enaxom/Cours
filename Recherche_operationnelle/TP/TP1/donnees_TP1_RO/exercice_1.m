% Objectif du programme lineaire P1 :
C = ...

% Contraintes du programme lineaire P1 :
A = ...
B = ...
Binf = ...

% Resolution du programme lineaire P1 :
[X,zmin] = linprog(...);

% Affichage du resultat :
fprintf('\nLa solution vaut (%.3f,%.3f)\n',X);
fprintf('La valeur maximale de l''objectif vaut %f\n\n',-zmin);