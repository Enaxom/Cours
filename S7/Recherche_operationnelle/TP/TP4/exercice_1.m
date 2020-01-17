clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

sequence_1 = 'AAGTAGGC';
sequence_2 = 'ATGGTACGTC';
distance = 'distance_ADN';

[g,score,liste_i,liste_j] = alignement(sequence_1,sequence_2,distance);

figure('Name','Alignement de sequences d''ADN','Position',[0.2*L,0.1*H,0.6*L,0.7*H]);
imagesc(g);
colormap gray;
hold on;
set(gca,'FontSize',20);

% Affichage du chemin optimal :
plot(liste_j,liste_i,'x-r','MarkerSize',20,'LineWidth',5);

% Affichage du score de l'alignement :
fprintf('Le score de l''alignement vaut : %f\n',score);