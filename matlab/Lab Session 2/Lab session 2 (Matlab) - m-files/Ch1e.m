% [no slide about this] equivariances of OLS
clear
n=100;
X1=ones(n,1);     % an intercept is included in the regression
X2=randn(n,1);
X3=X2+randn(n,1); % so X2 and X3 are correlated
X=[X1 X2 X3]; beta=[1 2 -1]'; K=3; epsilon=randn(n,1); y=X*beta+epsilon; b=X\y
% regression equivariance
alpha=rand(K,1)
b_1=X\(y+X*alpha)
b+alpha