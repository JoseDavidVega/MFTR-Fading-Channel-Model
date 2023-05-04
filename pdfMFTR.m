function y=pdfMFTR(G,m,K,D,mu,GM)
%   PDF de la MFTR
%

a1=m*mu*(1+K)/(m+mu*K)/GM;
a2=m*mu*(1+K)/(m+mu*K*(1+D))/GM;
a3=m*mu*(1+K)/(m+mu*K*(1-D))/GM;
a4=mu*(1+K)/GM;

for p=1:length(G)   
x=G(p);
PDF_ANAL(p)=0;
for q=0:floor((m-1)/2)
   delta=-[a1 a2 a3 a4];
   beta=[1+2*q-m m-q-1/2 m-q-1/2 mu-m];
   C=gamma(1+2*(m-1)-2*q)/gamma(1+q)/gamma(1+m-1-q)/gamma(1+m-1-2*q);
   PDF_TERM=(-1)^q*((a2*a3)^(0.5)/a1)^(m-1-2*q)*C*(1/gamma(mu)).*(x).^((mu-1)).*Phi2(x,mu,delta,beta,1e4);
   PDF_ANAL(p)=PDF_ANAL(p)+PDF_TERM; 
end
PDF_ANAL(p)=((a2*a3)^(m/2))/(2^(m-1)*(a4)^(m-mu))*PDF_ANAL(p);
end

y=PDF_ANAL;

end