function [X,zmin] = resolution(C,A,B,Binf,Bsup,X,zmin)

	options = optimset('Display','off');
	[X_test,zmin_test,exitflag] = linprog(C,A,B,[],[],Binf,Bsup,[],options);	% exitflag == -2 si EA vide

	if exitflag ~= -2 && zmin_test < zmin	% Si l'EA n'est pas vide et que la solution est meilleure que zmin
		x_1 = X_test(1);
		x_2 = X_test(2);
		solution_entiere = entier(x_1) && entier(x_2);

		if solution_entiere 	% Si la solution du PL est entiere
			X = X_test;
			zmin = zmin_test;
		else	% Si la solution du PL n'est pas entiere
			if ~entier(x_1)		% Si x_1 n'est pas entier
				% PL fils de gauche :
				[X,zmin] = resolution(C,A,B,[Binf(1);Binf(2)],[floor(x_1);Bsup(2)],X,zmin);

				% PL fils de droite :
				[X,zmin] = resolution(C,A,B,[ceil(x_1);Binf(2)],[Bsup(1);Bsup(2)],X,zmin);
			else					% Si x_2 n'est pas entier
				% PL fils de gauche :
				[X,zmin] = resolution(C,A,B,[Binf(1);Binf(2)],[Bsup(1);floor(x_2)],X,zmin);

				% PL fils de droite :
				[X,zmin] = resolution(C,A,B,[Binf(1);ceil(x_2)],[Bsup(1);Bsup(2)],X,zmin);
			end
		end
	end
end

function resultat = entier(valeur)
	epsilon = 0.0001;
	resultat = abs(valeur-round(valeur))<epsilon;
end
