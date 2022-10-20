% [slide 64] distribution of ratio of independent quadratic forms in standard normal random vectors, Thm
clear
n=5; p=3; q=n-p; A=rand(n,p); A=A*inv(A'*A)*A'; B=eye(n)-A; % A and B are now nxn idempotent matrices of rank p and q=n-p
% check that: AB=0, B is idempot, rank(B)=q=n-p
A*B
eigB=eig(B)
rankB=trace(B)
% generate R ratios of quadratic forms and store these in f
R=10^6; f=zeros(R,1);
for r=1:R
    X=randn(n,1);
    a=X'*A*X/p;
    b=X'*B*X/q;
    f(r)=a/b;   
end
% compare histogram of f with pdf of F(p,q)
f=f(f<20); % we look at the interval [0,20] on the x-axis
figure(1)
subplot(1,2,1), histogram(f,1000,'Normalization','pdf'),xlim([0,20]), title('hist of ratio of quad. forms')
x=0:0.01:20;
subplot(1,2,2), plot(x,fpdf(x,p,q)), title(sprintf('F(%d,%d) density',p,q))