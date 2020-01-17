% Objectif du programme lineaire P1 :
C = [-10000 -9000];

% Contraintes du programme lineaire P1 :
A = [0.06 0.05;10 20;1 0];
B = [60;15000;800];
Binf = [0;0];

% Resolution du programme lineaire P1 :
[X,zmin] = linprog(C,A,B,[],[],Binf,[]);

% Affichage du resultat :
fprintf('\nLa solution vaut (%.3f,%.3f)\n',X);
fprintf('La valeur maximale de l''objectif vaut %f\n\n',-zmin);