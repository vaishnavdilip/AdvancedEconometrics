% [slide 93] Thm, parts (a) and (b)
clear
n=50; X=randn(n,1); beta=1; sigma=1; % we keep X fixed in all R replications
R=10^5; B=zeros(R,1); % OLS estimates b will be stored in B
for r=1:R
    epsilon=sigma*randn(n,1);
    y=X*beta+epsilon; b=X\y;
    B(r)=b;
end
% part (a): unbiasedness of OLS
beta
mean_b=mean(B)
% part (b): variance of OLS
fprintf('Theoretical variance:\n %f\n',sigma^2*inv(X'*X))
fprintf('Simulation variance:\n %f\n',var(B))
