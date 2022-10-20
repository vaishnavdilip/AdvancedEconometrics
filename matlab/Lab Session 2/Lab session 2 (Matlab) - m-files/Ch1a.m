% [slide 88] the function SSR(.) is minimized at the OLS estimator b
clear
n=50; X=randn(n,1); beta=1; epsilon=randn(n,1); y=X*beta+epsilon; % generates a data set
b=X\y; % OLS estimate
e=y-X*b; % OLS residuals
SSRb=e'*e; % SSR function at OLS estimate

betatilde=0.5:0.01:1.5; 
SSR=zeros(length(betatilde),1); %preallocation
for j=1:length(betatilde)  
    res=y-X*betatilde(j); % residual vector for given value of betatilde
    SSR(j)=res'*res; % SSR(.) function
end

plot(betatilde,SSR,'-b')
hold on ; plot(b,SSRb,'r*') % check that that SSR(.) is minimized at b
legend('SSR(betatilde)', 'SSR(b)')