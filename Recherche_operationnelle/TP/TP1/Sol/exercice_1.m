% Objectif du programme lineaire P1 :
C = [-10000 -9000]

% Contraintes du programme lineaire P1 :
A = [10 20; 0.06 0.05]
B = [15000 60]
Binf = [0 0]
Bsup = [860 inf]

% Resolution du programme lineaire P1 :
[X,zmin] = linprog(C, A, B, [], [], Binf, Bsup);

% Affichage du resultat :
fprintf('\nLa solution vaut (%.3f,%.3f)\n',X);
fprintf('La valeur maximale de l''objectif vaut %f\n\n',-zmin);