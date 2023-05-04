function y=Phi2(x,lambda,delta,beta,N)
A=15;
% Transformada inversa de Laplace
K=exp (A/2).*(x.^(-1));
y1=0;
alphainv=[0.5,ones(1,N-1)];
for n=1:N
    y1=y1+(-1)^(n-1)*alphainv(n)*...
    real(LaplacePhi2((A+2*pi*1i*(n-1))*((2*x).^(-1)),lambda,delta,beta));
end
y1=K.*y1;
% _Multiplicaci?n por el t?rmino x^(-lambda+1)
y=(x.^(-lambda+1)).*y1;
end

function y=LaplacePhi2(s,lambda,delta,beta)
P=ones(1,length(s));
for k=1:length(beta)
    P=P.*((1-delta(k)*(s.^(-1))).^(-beta(k)));
end
y=gamma(lambda)*(s.^(-lambda)).*P;
end