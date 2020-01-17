clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage de l'image :
Im = imread('maldive.jpg');
Im = Im(10:80,10:100,:);
figure('Name','Probleme du maitre-nageur','Position',[0.2*L,0,0.8*L,H]);
imagesc(Im);
axis equal;
axis off;
hold on;
drawnow;

% Vitesse de deplacement du maitre-nageur :
vitesse = double(rgb2gray(Im));
[nb_lignes,nb_colonnes] = size(vitesse);

% Les matrices I et J contiennent les numeros de lignes et de colonnes des pixels:
[J,I] = meshgrid(1:nb_colonnes,1:nb_lignes);

% Matrice d'adjacence M et matrice des poids P :
% A completer
% ...
X = nb_colonnes*nb_lignes; 
M = zeros(X);
P = zeros(X);
for i = 1:X
    X1 = J(i);
    Y1 = I(i);
    for j = 1:X
        X2 = J(j);
        Y2 = I(j);
        dist = sqrt(((X2-X1)^2)+((Y2-Y1)^2));
        if dist <= sqrt(2)
            M(i,j) = 1;
            P(i,j) = (dist*2)/(vitesse(i)+vitesse(j));
        end
    end
end

% Positionnement du maitre-nageur :
fprintf('Positionnez le maitre-nageur en cliquant sur l''image !\n');
[x_MN,y_MN] = ginput(1);
j_MN = round(x_MN);
i_MN = round(y_MN);
plot(j_MN,i_MN,'xr','MarkerSize',10,'LineWidth',4);
drawnow;

% Calcul des chemins optimaux par l'algorithme de Dijkstra :
% A completer
% ...
mn = sub2ind(size(Im),i_MN,j_MN);
[couts,chemins] = dijkstra(M,P,mn);

while true
	% Positionnement du noye :
	disp('Positionnez le noye en cliquant sur l''image !');
	[j2,i2] = ginput(1);
	j2 = round(j2);
	i2 = round(i2);
	plot(j2,i2,'xr','MarkerSize',10,'LineWidth',4);

	% Affichage du chemin optimal :
	% A completer et decommenter
    n = sub2ind(size(Im),i2,j2);
    chemin_optimal = chemins{n};
    disp(chemin_optimal)
	[i,j] = ind2sub(size(Im), chemin_optimal);
	plot(j,i,'-r','LineWidth',2);
end