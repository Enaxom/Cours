clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture de l'image 'cameraman.tif' (image interne de Matlab) :
I_max = 255;
I_min = 0;
I = imread('cameraman.tif');
[nb_lignes,nb_colonnes] = size(I);
I = double(I);

% Affichage de l'image :
figure('Name','Image interne de Matlab','Position',[0,0,0.33*L,0.45*H]);
imagesc(I);
axis off;
axis equal;
colormap gray;

% Affichage de l'histogramme de l'image :
histogramme = hist(I(:),[I_min:I_max]);
figure('Name','Histogramme des niveaux de gris','Position',[0.33*L,0,0.33*L,0.45*H]);
plot([I_min:I_max],histogramme);
axis([I_min I_max 0 1.1*max(histogramme)]);
xlabel('Niveau de gris','FontSize',15);
ylabel('Frequence absolue','FontSize',15);
set(gca,'FontSize',20);

% Definition de la s�rie statistique 2D :
% Les matrices I et J contiennent les numeros de lignes et de colonnes des pixels:
% gris = double(rgb2gray(I));
[Y,X] = meshgrid(1:nb_colonnes,1:nb_lignes);
N = nb_lignes*nb_colonnes;
I_gauche = zeros(1,N-1);
index = 0;
for i = 1:nb_lignes
    for j = 1:nb_colonnes-1
        index = index + 1;
        I_gauche(index) = I(i,j);
    end
end

I_droite = zeros(1,N-1);
index = 0;
for i = 1:nb_lignes
    for j = 2:nb_colonnes
        index = index + 1;
        I_droite(index) = I(i,j);
    end
end

% Affichage de la serie statistique 2D sous la forme d'un nuage de points :
figure('Name','Mise en evidence de la correlation entre pixels voisins','Position',[0.66*L,0,0.33*L,0.45*H]);
plot(I_gauche,I_droite,'b+');
axis([I_min I_max I_min I_max]);
xlabel('Niveau de gris du pixel de gauche','FontSize',15);
ylabel('Niveau de gris du pixel de droite','FontSize',15);
hold on;
set(gca,'FontSize',20);
axis equal;

% Calcul du coefficient de correlation lineaire :
moyenne_abscisses = mean(I_gauche);
moyenne_ordonnees = mean(I_droite);
% variance_abscisses = ...
% variance_ordonnees = ...
% covariance = ...
% coefficient_correlation = ...
% a = ...
% b = ...

% Affichage de la droite de regression :
% x = I_min:I_max;
% y = a*x+b;
% plot(x,y,'r','LineWidth',3);
