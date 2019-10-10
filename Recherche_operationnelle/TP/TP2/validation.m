function validation(solution)

N = size(solution,1);

% Contraintes "chaque case est entiere" :
for i = 1:N
	for j = 1:N
		valeur = solution(i,j);
		if valeur-floor(valeur)
			fprintf('Case (%d,%d) : valeur non entiere !\n\n',i,j);
			return;
		end
	end
end

% Contraintes "une seule occurrence de chaque entier par ligne" :
for i = 1:N
	for k = 1:N
		nb_occurrences = 0;
		for j = 1:N
			nb_occurrences = nb_occurrences+(solution(i,j)==k);
		end
		if nb_occurrences==0
			fprintf('Ligne %d : pas d''occurrence de l''entier %d !\n\n',i,k);
			return;
		else
			if nb_occurrences>1
				fprintf('Ligne %d : trop d''occurrences de l''entier %d !\n\n',i,k);
				return;
			end
		end
	end
end

% Contraintes "une seule occurrence de chaque entier par colonne" :
for j = 1:N
	for k = 1:N
		nb_occurrences = 0;
		for i = 1:N
			nb_occurrences = nb_occurrences+(solution(i,j)==k);
		end
		if nb_occurrences==0
			fprintf('Colonne %d : pas d''occurrence de l''entier %d !\n\n',j,k);
			return;
		else
			if nb_occurrences>1
				fprintf('Colonne %d : trop d''occurrences de l''entier %d !\n\n',j,k);
				return;
			end
		end
	end
end

% Contraintes "une seule occurrence de chaque entier par bloc" :
o = sqrt(N);
for i1 = 1:o
	for j1 = 1:o
		for k = 1:N
			nb_occurrences = 0;
			for i2 = 1:o
				i = (i1-1)*o+i2;
				for j2 = 1:o
					j = (j1-1)*o+j2;
					nb_occurrences = nb_occurrences+(solution(i,j)==k);
				end
			end
			if nb_occurrences==0
				fprintf('Bloc (%d,%d) : pas d''occurrence de l''entier %d !\n\n',i1,j1,k);
				return;
			else
				if nb_occurrences>1
					fprintf('Bloc (%d,%d) : trop d''occurrences de l''entier %d !\n\n',i1,j1,k);
					return;
				end
			end
		end
	end
end
