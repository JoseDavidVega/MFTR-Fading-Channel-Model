% This Matlab script generates the channel coefficients of the MFTR fading moel in the paper:
%
% J. D. Vega Sánchez, F. Javier López-Martínez, José F. Paris, Juan M. Romero-Jerez,
%“The Multi-cluster Fluctuating Two-Ray Fading Model,”
%Download article: https://arxiv.org/pdf/2212.02448.pdf

clear;
close all;
%% Choose Envelope or Power
% type= 0 for amplitude distributions
% type= 1 for power/SNR distributions
type=0;

% Number of MC simulations
Nsim=1e4;

% Fading model parameters
m=5;
mu=3;
K=11.74;
Delta=.92;
omega=3.8;


%% Empirical PDF/CDF
% RV Generation
rvsim = genMFTRsim(m,mu,Delta,K,Nsim,type);

if type==0
    rvsim=rvsim.*sqrt(omega);    
else
    rvsim=rvsim*omega;
end

%[pdfsim,xi] = ksdensity(rvsim);
[pdfsim,xi] = pdfSim(rvsim);
[cdfsim,yi] = ecdf(rvsim);

%% Theoretical PDF/CDF
if type==1
    xtheo=linspace(0,5*omega,1e3);
    ytheo=logspace(-4,2,1e3);
    pdftheo=pdfMFTR(xtheo,m,K,Delta,mu,omega);
    cdftheo=CDFMFTR(ytheo,m,K,Delta,mu,omega);
    disp('Power')
else
    xtheo=linspace(0,3*sqrt(omega),1e3);
    ytheo=logspace(-4,2,1e3);
    whos
    pdftheo=2.*xtheo.*pdfMFTR(xtheo.^2,m,K,Delta,mu,omega);
    cdftheo=CDFMFTR(ytheo.^2,m,K,Delta,mu,omega);
    disp('Amplitude')
end



%% Plot results
    ejex=xtheo;
    ejey=ytheo;
    %PDF
    figure(1);
    plot(xi,pdfsim,'o','LineWidth',1.2); 
    hold on; 
    plot(ejex,pdftheo,'LineWidth',1.1);
    set(gca,'FontSize',12,'fontname','times','LineWidth',1)
    if type==0
        ylabel('$f_R(r)$','FontSize',14,'fontname','times','Interpreter','latex');
        xlabel({'$r$'},'Interpreter','latex','FontSize',16,'fontname','times')    
    else
        ylabel('$f_\gamma(\gamma)$','FontSize',14,'fontname','times','Interpreter','latex');
        xlabel({'$\gamma$'},'Interpreter','latex','FontSize',16,'fontname','times')
    end
   
    leg= legend({'Sim','Theo'},...
    'Interpreter','latex','FontSize',10,'fontname','times');
    leg.ItemTokenSize = [12,18];
     grid on;
     axis([ejex(1),ejex(end),0,1.1*max(pdftheo)])
    
     % CDF
     
    figure(2);
    semilogy(10*log10(yi),cdfsim,'--','LineWidth',1.2); 
    hold on; 
    semilogy(10*log10(ejey),cdftheo,'LineWidth',1.1);
    set(gca,'FontSize',12,'fontname','times','LineWidth',1)
    if type==0
        ylabel('$F_R(r)$','FontSize',14,'fontname','times','Interpreter','latex');
        xlabel({'$r$'},'Interpreter','latex','FontSize',16,'fontname','times')    
    else
        ylabel('$F_\gamma(\gamma)$','FontSize',14,'fontname','times','Interpreter','latex');
        xlabel({'$\gamma$'},'Interpreter','latex','FontSize',16,'fontname','times')
    end
   
    leg= legend({'Sim','Theo'},...
    'Interpreter','latex','FontSize',10,'fontname','times');
    leg.ItemTokenSize = [12,18];
     grid on;
     axis([10*log10(ejey(1)),10*log10(ejey(end)),1/Nsim,1])
     
  

 %% functions
function [pdf_sim,r]= pdfSim(h)
[pdf_sim,r] = hist(h,length(h)./1e3); %Here, The histogram is built
pdf_sim = pdf_sim/sum(pdf_sim)/(r(2)-r(1)); % normalization
end
