function [g,score,liste_i,liste_j] = alignement_bis(sequence_1,sequence_2,distance)

poids_1 = 1;
poids_2 = 1;
poids_3 = 1;

longueur_sequence_1 = length(sequence_1);
longueur_sequence_2 = length(sequence_2);

nb_lignes = longueur_sequence_1+1;
nb_colonnes = longueur_sequence_2+1;

g = Inf*ones(nb_lignes,nb_colonnes);
g(1,1) = 0;
i_precedent = zeros(longueur_sequence_1,longueur_sequence_2);
j_precedent = zeros(longueur_sequence_1,longueur_sequence_2);
for i = 2:nb_lignes
	indice_sequence_1 = i-1;
	for j = 2:nb_colonnes
		indice_sequence_2 = j-1;
		d = feval(distance,sequence_1,sequence_2,indice_sequence_1,indice_sequence_2);
		[val_min,ind_min] = min([g(i-1,j)+poids_1*d,g(i-1,j-1)+poids_2*d,g(i,j-1)+poids_3*d]);
		g(i,j) = val_min;
		if ind_min~=3
			i_precedent(indice_sequence_1,indice_sequence_2) = 1;
		end
		if ind_min~=1
			j_precedent(indice_sequence_1,indice_sequence_2) = 1;
		end
	end
end

g = g(2:end,2:end);
score = g(end,end)/(longueur_sequence_1+longueur_sequence_2);

% Chemin optimal :
i_courant = longueur_sequence_1;
j_courant = longueur_sequence_2;
liste_i = i_courant;
liste_j = j_courant;
while i_courant>1 | j_courant>1
	i_courant = i_courant-i_precedent(i_courant,j_courant);
	j_courant = j_courant-j_precedent(i_courant,j_courant);
	liste_i = [liste_i i_courant];
	liste_j = [liste_j j_courant];
end
