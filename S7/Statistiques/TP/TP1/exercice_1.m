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
I_gauche = I(:,1:nb_colonnes-1);
I_gauche = I_gauche(:);
I_droite = I(:,2:nb_colonnes);
I_droite = I_droite(:);

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
moyenne_abscisses = mean(I_gauche)
moyenne_ordonnees = mean(I_droite)
variance_abscisses = mean((I_gauche-moyenne_abscisses).^2)
variance_ordonnees = mean((I_droite-moyenne_ordonnees).^2)
covariance = mean((I_gauche-moyenne_abscisses).*(I_droite-moyenne_ordonnees))
coefficient_correlation = covariance / (sqrt(variance_abscisses).*sqrt(variance_ordonnees))
a = covariance / variance_abscisses
b = moyenne_ordonnees - (a * moyenne_abscisses)

% Affichage de la droite de regression :
x = I_min:I_max;
y = a*x+b;
plot(x,y,'r','LineWidth',3);
