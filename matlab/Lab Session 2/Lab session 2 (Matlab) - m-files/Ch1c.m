% [slide 99] Thm: distribution of the t statistic
clear
n=15; X=randn(n,1); beta=1; sigma=1;% we keep X fixed in all R replications
R=10^6; B=zeros(R,1); SSR=zeros(R,1);

for r=1:R
    epsilon=randn(n,1); y=X*beta+sigma*epsilon; b=X\y; e=y-X*b;
    B(r)=b;
    SSR(r)=e'*e;
end

S2=SSR/(n-1); V=S2/(X'*X); SE=sqrt(V); % standard errors (K=1 because there is 1 regressor)

%%%% the case when H0 is true %%%%
t=(B-beta)./SE; 

% compare histogram of t with pdf of t(n-1) and pdf of N(0,1) 
% note: when n is small (such as n=15 here), the difference between t(n-1) and of N(0,1) is visible in the tails (because n-K is small)
%       for n>30 the difference is negligible
t=t(-4<t&t<4); % we look at interval [-4,4] on the x-axis
figure(1)
x=-4:0.01:4;
subplot(1,4,1), histogram(t,1000,'Normalization','pdf'), xlim([-4,4]), title('hist of t stats (true H_0)')
subplot(1,4,2), plot(x,tpdf(x,n-1)), title('t(n-K) density')
subplot(1,4,3), plot(x,normpdf(x)), title('N(0,1) density')

%%%% the case when H0 is false %%%%
t=(B-0.2)./SE;  % t statistics when H0:beta=0.2 is false
t=t(-4<t&t<4); % here we have to consider a wider interval
subplot(1,4,4), histogram(t,1000,'Normalization','pdf'), xlim([-4,4]), title('hist of t stats (false H_0)')