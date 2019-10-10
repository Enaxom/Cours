clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Mots de references :
mots_M01{1} = parametrage('WAV/M01_droite.wav');
mots_M01{2} = parametrage('WAV/M01_gauche.wav');
mots_M01{3} = parametrage('WAV/M01_plusbas.wav');
mots_M01{4} = parametrage('WAV/M01_plushaut.wav');
mots_M01{5} = parametrage('WAV/M01_tournedroite.wav');
mots_M01{6} = parametrage('WAV/M01_tournegauche.wav');

nb_mots = 6;
nb_locuteurs = 13;

I = imread('cameraman.tif');
position = [0.33*L,0.33*H,0.33*L,0.33*H];

figure('Position',position);
imagesc(I);
axis equal;
axis off;
colormap gray;

while true
	fprintf(1,'\nTapez retour-chariot pour lancer un test\n');
	pause;

	indice_mot = randi(nb_mots);
	switch indice_mot
		case 1
			mot = '_droite';
		case 2
			mot = '_gauche';
		case 3
			mot = '_plusbas';
		case 4
			mot = '_plushaut';
		case 5
			mot = '_tournedroite';
		case 6
			mot = '_tournegauche';
	end
	indice_locuteur = randi(nb_locuteurs);
	nom_fichier = ['WAV/M' num2str(indice_locuteur,'%02d') mot '.wav'];
	[signal,frequence_echantillonnage] = audioread(nom_fichier);
	sound(signal,frequence_echantillonnage);

	fprintf(1,'\n%s\nMot reconnu : ',nom_fichier);
	mot_test = parametrage(nom_fichier);
	distances = zeros(1,nb_mots);
	for indice_reference = 1:nb_mots
		[g,score] = ...
		distances(indice_reference) = ...
	end
	[valeur_min,argument_min] = min(...);
	switch ...
		case 1
			fprintf(1,'Droite !\n');
			close;
			position = position + [0.1*L,0,0,0];
			figure('Position',position);
			imagesc(I);
			axis equal;
			axis off;
			colormap gray;
		case 2
			fprintf(1,'Gauche !\n');
			close;
			position = position - [0.1*L,0,0,0];
			figure('Position',position);
			imagesc(I);
			axis equal;
			axis off;
			colormap gray;
		case 3
			fprintf(1,'Plus bas !\n');
			close;
			position = position - [0,0.1*H,0,0];
			figure('Position',position);
			imagesc(I);
			axis equal;
			axis off;
			colormap gray;
		case 4
			fprintf(1,'Plus haut !\n');
			close;
			position = position + [0,0.1*H,0,0];
			figure('Position',position);
			imagesc(I);
			axis equal;
			axis off;
			colormap gray;
		case 5
			fprintf(1,'Tourne droite !\n');
			I = imrotate(I,-90);
			imagesc(I);
			axis equal;
			axis off;
		case 6
			fprintf(1,'Tourne gauche !\n');
			I = imrotate(I,90);
			imagesc(I);
			axis equal;
			axis off;
	end
end
