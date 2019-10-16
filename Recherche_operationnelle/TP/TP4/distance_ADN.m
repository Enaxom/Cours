function [distance] = distance_ADN(s1,s2,i1,i2)

if s1(i1) = s2(i2)
	distance = 0;
else
	distance = 1;
end
