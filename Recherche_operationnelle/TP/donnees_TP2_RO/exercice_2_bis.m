function exercice_2(nom_fichier)

% Traitements preliminaires :
nom_complet = strcat(nom_fichier,'.txt');
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
for i = 1:N
	for k = 1:N
		numero_contrainte = numero_contrainte+1;
		for j = 1:N
			indice = (i-1)*N*N+(j-1)*N+k;
			Aeq(numero_contrainte,indice) = 1;
		end
	end
end

% Contraintes "une seule occurrence de chaque entier par colonne" :
for j = 1:N
	for k = 1:N
		numero_contrainte = numero_contrainte+1;
		for i = 1:N
			indice = (i-1)*N*N+(j-1)*N+k;
			Aeq(numero_contrainte,indice) = 1;
		end
	end
end

% Contraintes "une seule occurrence de chaque entier par bloc" :
for k = 1:N
    for l = 1:o
        for c = 1:o
            numero_contrainte = numero_contrainte+1;
            for i = 1:o
                for j = 1:o
                    x = i + (l-1)*o;
                    y = j + (c-1)*o;
                    indice = (x-1)*N*N+(y-1)*N+k;
                    Aeq(numero_contrainte,indice) = 1;
                end
            end
        end
    end            
end

% Initialisation des matrices C, Beq, Binf et Bsup :
C = -ones(1,n);
Beq = ones(m,1);
Binf = zeros(n,1);
Bsup = ones(n,1);

% Prise en compte des cases deja remplies :
for i = 1:N
    for j = 1:N
        if matrice_initiale(i, j) ~= 0
            indice = (i-1)*N*N+(j-1)*N + matrice_initiale(i, j);
            Binf(indice) = 1;
        end
    end
end

% Resolution du PL :
[X,zmin] = linprog(C,[],[],Aeq,Beq,Binf,Bsup);
fprintf('La valeur maximale de l''objectif vaut %f\n\n',-zmin);

% Affichagage des cases xij1
for i = 1:N
	for j = 1:N
		indice = (i-1)*N*N+(j-1)*N + 1;
		fprintf('%f',X(indice));
	end
end

% Affichage de la solution :
solution = affichage(X)

% Validation de la solution :
validation(solution);
