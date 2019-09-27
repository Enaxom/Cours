function exercice_2(nom_fichier)

% Traitements preliminaires :
nom_complet = strcat('Grilles/',nom_fichier,'.txt');
matrice_initiale = load(nom_complet);
N = size(matrice_initiale,1);
o = sqrt(N);		% Ordre du sudoku
n = N*N*N;		% Nombre de variables de decision
m = 4*N*N;		% Nombre de contraintes

% Initialisation de la matrice Aeq :
Aeq = zeros(m,n);
numero_contrainte = 0;

% Contraintes "un seul entier par case" :
for i = 1:N
	for j = 1:N
		numero_contrainte = numero_contrainte+1;
		for k = 1:N
			indice = (i-1)*N*N+(j-1)*N+k;
			Aeq(numero_contrainte,indice) = 1;
		end
	end
end

% Contraintes "une seule occurrence de chaque entier par ligne" :
% A completer...

% Contraintes "une seule occurrence de chaque entier par colonne" :
% A completer...

% Contraintes "une seule occurrence de chaque entier par bloc" :
% A completer...

% Initialisation des matrices C, Beq, Binf et Bsup :
C = -ones(1,n);
Beq = ones(m,1);
Binf = zeros(n,1);
Bsup = ones(n,1);

% Prise en compte des cases deja remplies :
% A completer...

% Resolution du PL :
[X,zmin] = linprog(C,[],[],Aeq,Beq,Binf,Bsup);
fprintf('La valeur maximale de l''objectif vaut %f\n\n',-zmin);

% Affichage de la solution :
solution = affichage(X)

% Validation de la solution :
validation(solution);
