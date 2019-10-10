function solution = affichage(X)

N = round(power(length(X),1/3));
solution = zeros(N,N);
epsilon = 0.001;
for indice = 1:size(X,1)
	if X(indice,1)>=1-epsilon
		k = mod((indice-1),N)+1;
		j = mod((indice-k)/N,N)+1;
		i = ((indice-k)/N-(j-1))/N+1;
		solution(i,j) = k;
	end
end

