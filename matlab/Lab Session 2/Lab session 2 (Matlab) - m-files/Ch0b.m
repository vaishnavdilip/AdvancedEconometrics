% [slide 63] distribution of quadratic form in standard normal random vector, 2nd Thm
clear
n=5; p=3;
A=rand(n,p); A=A*inv(A'*A)*A'; % A is now an nxn idempotent matrix of rank p
% checks of idempotency and rank
A
AA=A*A
eigA=eig(A)   % the eigenvalues of A are zeros and ones
rankA=trace(A)
% generate R quadratic forms and store these in qf
R=10^6; qf=zeros(R,1); 
for r=1:R
    X=randn(n,1);
    qf(r)=X'*A*X;
end
% compare histogram of qf with the pdf of chi2(p)
qf=qf(qf<20); % we look at the interval [0,20] on the x-axis
figure(1)
subplot(1,2,1), histogram(qf,1000,'Normalization','pdf'), xlim([0,20]), title('hist of quad. forms')
x=0:0.01:20;
subplot(1,2,2), plot(x,chi2pdf(x,p)), title(sprintf('Chi2(%d) density',p))