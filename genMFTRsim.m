%% GENERATING NORMALIZED MFTR VARIATES FROM ITS PHYSICAL MODEL
% Parameters:
%   m:  shape parameters for the joint fluctuation of the two LoS components
%   mu: number of multipath clusters
%   Delta:  [0,1] amplitude imbalances between the two LoS components
%   K: Rician-like K parameter
%   Nsim: number of IFTR variates to be generated
%   type: 0 - amplitude  / 1- power
function rvsim = genMFTRsim(m,mu,Delta,K,Nsim,type)

gb = 1;
Sig=sqrt(gb/sqrt(2*mu*(1+K)));

b=Sig*Sig*mu*K;
% Specular component calculation for special channel parameters (K,Delta)

V1=sqrt(b*(1+sqrt(1-Delta.^2)));
V2=sqrt(b*(1-sqrt(1-Delta.^2)));

% Parameters Check
% Delta should be (V1*V2*2)/(V1^2+V2^2);
% K should be (V1^2+V2^2)/(2*mu*Sig^2);
%(V1*V2*2)/(V1^2+V2^2)
%(V1^2+V2^2)/(2*mu*Sig^2)

z = random('nakagami',m,1,Nsim,1); %zita for fluctuating

F1 = 2*pi*rand(Nsim,1); % Phase 1
F2 = 2*pi*rand(Nsim,1);% Phase 2


clus=0;
for jj=1:mu-1
    X = sqrt(Sig^2)*randn(Nsim,1); % Normal random
    Y = sqrt(Sig^2)*randn(Nsim,1); %Normal random
    clus=clus+X.^2+Y.^2; 
end
X = sqrt(Sig^2)*randn(Nsim,1); % Normal random
Y = sqrt(Sig^2)*randn(Nsim,1); %Normal random
% FTR power Channel
h= (V1*(z).*cos(F1) + V2*(z).*cos(F2)+X).^2+ (V1*(z).*sin(F1) + V2*(z).*sin(F2)+Y).^2+clus;
 
% Normalization to unit power
h=h./(V1^2+V2^2+2*mu*Sig^2);

if type==0
    rvsim=sqrt(h);
else
    rvsim=abs(h);
end

end