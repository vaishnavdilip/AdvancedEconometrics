% [slide 103] Thm: distribution of the F statistic
clear
n=15;
X1=ones(n,1);     % an intercept is included in the regression
X2=randn(n,1);
X3=X2+randn(n,1); % so X2 and X3 are correlated
X=[X1 X2 X3]; beta=[1 2 -1]'; K=3; % we keep X fixed in all R replications
R=10^6; SSRu=zeros(R,1); SSRr=zeros(R,1); SSRrfalse=zeros(R,1);

for r=1:R
    epsilon=randn(n,1); y=X*beta+epsilon; b=X\y; e=y-X*b; SSRu(r)=e'*e;
    
    % the case when H0 is true
    %    suppose we are testing H0: beta2=2 and beta3=-1 (which is true)
    %    we form the restricted regression and estimate it
    %    y-2*X2-(-1)*X3 = X1*beta1 + disturbance    
    new_y=y-2*X2-(-1)*X3; b=X1\new_y; e=new_y-X1*b; SSRr(r)=e'*e;
    
    % the case when H0 is false
    %    suppose we are testing H0: beta2=beta3=0 (which is false)
    %    we form the restricted regression and estimate it
    %    y-0*X2-0*X3 = X1*beta1 + disturbance
    b=X1\y; e=y-X1*b; SSRrfalse(r)=e'*e;    
end

% the case when H0 is true
A=(SSRr-SSRu)/2; % numerator   of F (there are 2 hypotheses being tested)
B=SSRu/(n-K);    % denominator of F 
F=A./B;          % F statistics (a vector with R elements)
% we compare the histogram of F with the pdf of F(2,n-K)
F=F(F<20); % we look at interval [0,20] on the x-axis
figure(1)
x=0:0.01:20; 
subplot(1,3,1), histogram(F,1000,'Normalization','pdf'), xlim([0,20]), title('hist of F stats (true H_0)')
subplot(1,3,2), plot(x,fpdf(x,2,n-K)), title('F(2,n-K) density') 

% the case when H0 is false
A=(SSRrfalse-SSRu)/2; 
F=A./B;          % note that B depends only on SSRu, so it stays the same
F=F(F<20); % we look at interval [0,20] on the x-axis
subplot(1,3,3), histogram(F,1000,'Normalization','pdf'), xlim([0,20]), title('hist of F stats (false H_0)')