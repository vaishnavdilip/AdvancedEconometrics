% [slide 76] multivariate normal probabilities
% compute Pr[0<X<1] where X is bivariate standard normal
clear
R=10^6;
X1=randn(R,1); % R draws of the first  element of X
X2=randn(R,1); % R draws of the second element of X 
I=0<X1 & X1<1 & 0<X2 & X2<1; % I is an indicator: I=1 if 0<X<1 and I=0 otherwise.
Pr=mean(I)
standarderror=sqrt(Pr*(1-Pr)/R)