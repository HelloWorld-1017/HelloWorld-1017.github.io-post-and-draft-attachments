clc,clear,close all

rng(1)

load fisheriris.mat
meas = meas(1:50,:);

mu = mean(meas);
Sigma = cov(meas);

% numEpoch = 10000;
% numEpoch = 20;
numEpoch = 1;

numGs = 10:10:1000;
% numGs = 1e3:100:1e4;
% numGs = 1e4:200:2e4;
% numGs = [10:10:1000-10,1e3:100:1e4-100];
% numGs = [10:10:1000-10,1e3:100:1e4-100,1e4:1000:2e4];


pValue_As = nan(1,numel(numGs));
pValue_Bs = nan(1,numel(numGs));
pValue_skew_correcteds = nan(1,numel(numGs));
pValue_kurt_correcteds = nan(1,numel(numGs));

for j = 1:numEpoch
    tic
    for i = 1:numel(numGs)
        [pValue_As(j,i),pValue_Bs(j,i),pValue_skew_correcteds(j,i),pValue_kurt_correcteds(j,i)] = helperMardia(mu,Sigma,numGs(i));
    end
    disp(j)
    toc
end

pValue_As = mean(pValue_As,1);
pValue_Bs = mean(pValue_Bs,1);
pValue_skew_correcteds = mean(pValue_skew_correcteds,1);
pValue_kurt_correcteds = mean(pValue_kurt_correcteds,1);

figure("Position",[197,30,1553,840],"Color","w")
tiledlayout(2,1)
nexttile
hold(gca,"on"),box(gca,"on"),grid(gca,"on")
plot(numGs,pValue_As,"LineWidth",1.5,"DisplayName","Wiki version","Color","b","Marker","o")
plot(numGs,pValue_skew_correcteds,"LineWidth",1.5,"DisplayName","Real Statistics Version","Color","r","Marker","square")
xlabel("Sample size")
ylabel("p-value")
legend("Location","southeast")
title(sprintf("Test for skewness (the number of repeated experiment: %s)",num2str(numEpoch)))
ylim([0,1])

nexttile
hold(gca,"on"),box(gca,"on"),grid(gca,"on")
plot(numGs,pValue_Bs,"LineWidth",1.5,"DisplayName","Wiki version","Color","b","Marker","o")
plot(numGs,pValue_kurt_correcteds,"LineWidth",1.5,"DisplayName","Real Statistics Version","Color","r","Marker","square")
xlabel("Sample size")
ylabel("p-value")
legend("Location","southeast")
title(sprintf("Test for kurtosis (the number of repeated experiment: %s)",num2str(numEpoch)))
ylim([0,1])

pngFileName = sprintf("results-Epochs%s-%s.png",num2str(numEpoch),num2str(numGs(end)));
exportgraphics(gcf,pngFileName,"Resolution",600)
matFileName = sprintf("results-Epochs%s-%s.mat",num2str(numEpoch),num2str(numGs(end)));
save(matFileName,"pValue_As","pValue_Bs","pValue_skew_correcteds","pValue_kurt_correcteds")

function [pValue_A,pValue_B,pValue_skew_corrected,pValue_kurt_corrected] = helperMardia(mu,Sigma,numG)
% Generate samples
data = mvnrnd(mu,Sigma,numG);

[n,k] = size(data);
Sigma_hat = cov(data,0); % biased SCM
a = sum(((data-mu)/Sigma_hat*(data-mu)').^3,"all");
b = ((data-mu)/Sigma_hat*(data-mu)').^2;
b = sum(b.*diag(ones(1,height(b))),"all");

df = (1/6)*k*(k+1)*(k+2);

% % Wikipedia version Mardia's test
A = (1/6/n)*a;
B = sqrt(n/(8*k*(k+2)))*(1/n*b-k*(k+2));
pValue_A = chi2cdf(A,df);
[~,pValue_B,~,~] = ztest(B,0,1);
% pValue_B = 2*normcdf(B,0,1)

% % Real Statistics version Mardia's test
c = (n+1)*(n+3)*(k+1)/(n*(n+1)*(k+1)-6);
skew_corrected = (n^2)*c/(6*(n-1)^3)*a;
kurt_corrected = sqrt(n/(8*k*(k+2)))*(n/((n-1)^2)*b-k*(k+2));
pValue_skew_corrected = chi2cdf(skew_corrected,df);
[~,pValue_kurt_corrected,~,~] = ztest(kurt_corrected,0,1);
% pValue_kurt_corrected = 2*normcdf(kurt_corrected,0,1)

% fprintf("Wikipedia version Mardia's test\n" + ...
%     "p-value of the test for A: %.4f,\np-value of the test for B: %.4f\n" + ...
%     "Real Statistics version Mardia's test\n" + ...
%     "p-value of the test for skewness: %.4f,\np-value of the test for kurtosis: %.4f\n", ...
%     pValue_A,pValue_B,pValue_skew_corrected,pValue_kurt_corrected);
end