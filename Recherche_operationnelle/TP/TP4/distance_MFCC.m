function [distance] = distance_MFCC(m1,m2,i1,i2)
distance = sqrt(sum((m1(:,i1) - m2(:,i2)).^2))
