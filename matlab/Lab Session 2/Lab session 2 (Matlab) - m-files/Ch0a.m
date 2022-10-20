% [slides 62-63] mean and variance of F(m,n) distribution
clear
m=3; n=8;
f=frnd(m,n,10^6,1); % 10^7 draws from F(m,n)
fprintf('Sample mean and variance:\n %f  %f\n',mean(f), var(f))
fprintf('Theoretical mean and variance:\n %f  %f\n',n/(n-2), (2*m+2*n-4)/m/(n-4)*(n/(n-2))^2)