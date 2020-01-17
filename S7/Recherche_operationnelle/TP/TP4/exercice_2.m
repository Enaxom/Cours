clear;

sequence_reference = parametrage('WAV/M01_droite.wav');
distance = 'distance_MFCC';

nb_locuteurs = 13;
liste_scores = [];
for i = 1:nb_locuteurs
	nom = ['WAV/M' num2str(i,'%02d') '_droite.wav'];
	sequence_test = parametrage(nom);
	[g,score] = alignement(sequence_reference,sequence_test,distance);
	liste_scores = [liste_scores ; score];
end
liste_scores
