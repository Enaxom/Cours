% Mots de references :
mots_M01{1} = parametrage('WAV/M01_droite.wav');
mots_M01{2} = parametrage('WAV/M01_gauche.wav');
mots_M01{3} = parametrage('WAV/M01_plusbas.wav');
mots_M01{4} = parametrage('WAV/M01_plushaut.wav');
mots_M01{5} = parametrage('WAV/M01_tournedroite.wav');
mots_M01{6} = parametrage('WAV/M01_tournegauche.wav');

% Mots testes :
mots_M02{1} = parametrage('WAV/M02_droite.wav');
mots_M02{2} = parametrage('WAV/M02_gauche.wav');
mots_M02{3} = parametrage('WAV/M02_plusbas.wav');
mots_M02{4} = parametrage('WAV/M02_plushaut.wav');
mots_M02{5} = parametrage('WAV/M02_tournedroite.wav');
mots_M02{6} = parametrage('WAV/M02_tournegauche.wav');

nb_mots = length(mots_M01);
M = zeros(nb_mots);
for indice_test = 1:nb_mots
	distances = zeros(1,nb_mots);
	for indice_reference = 1:nb_mots
		[g,score] = alignement(mots_M01{indice_reference},mots_M02{indice_test},'distance_MFCC');
		distances(indice_reference) = score;
	end
	[valeur_min,argument_min] = min(distances);
	M(indice_test,argument_min) = M(indice_test,argument_min)+1;
end

M


