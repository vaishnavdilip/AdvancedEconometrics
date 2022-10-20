% [slide 68-69] inverse probability transform, Thm
clear
U=rand(10^6,1); % 10^6 draws from U(0,1)
mu=2; sigma=1; X=norminv(U,mu,sigma); % inverse cdf
% compare histogram of X with pdf N(mu,sigma)
X=X(-2<X&X<6 ); % we look at the interval [-2,6] on the x-axis
figure(1)
subplot(1,2,1), histogram(X,1000,'Normalization','pdf'), xlim([-2,6]), title('hist of N(mu,sig) inv. prob transform of U')
x=-2:0.01:6;
subplot(1,2,2), plot(x,normpdf(x,mu,sigma)), title(sprintf('N(%d,%d) density',mu,sigma))