clc;
clear all;

%-----------------------------------------------------%
% We setup the FIS and dataset, by:                   %                    
% 1. creating the input and output datasets           %
% 2. creating and customizing our FIS struct          %
%-----------------------------------------------------%

%rice taste dataset 
data_set=[
2.31	6.575	15.3	4.98	24
7.07	6.421	17.8	9.14	21.6
7.07	7.185	17.8	4.03	34.7
2.18	6.998	18.7	2.94	33.4
2.18	7.147	18.7	5.33	36.2
2.18	6.43	18.7	5.21	28.7
7.87	6.012	15.2	12.43	22.9
7.87	6.172	15.2	19.15	27.1
7.87	5.631	15.2	29.93	16.5
7.87	6.004	15.2	17.1	18.9
7.87	6.377	15.2	20.45	15
7.87	6.009	15.2	13.27	18.9
7.87	5.889	15.2	15.71	21.7
8.14	5.949	21	8.26	20.4
8.14	6.096	21	10.26	18.2
8.14	5.834	21	8.47	19.9
8.14	5.935	21	6.58	23.1
8.14	5.99	21	14.67	17.5
8.14	5.456	21	11.69	20.2
8.14	5.727	21	11.28	18.2
8.14	5.57	21	21.02	13.6
8.14	5.965	21	13.83	19.6
8.14	6.142	21	18.72	15.2
8.14	5.813	21	19.88	14.5
8.14	5.924	21	16.3	15.6
8.14	5.599	21	16.51	13.9
8.14	5.813	21	14.81	16.6
8.14	6.047	21	17.28	14.8
8.14	6.495	21	12.8	18.4
8.14	6.674	21	11.98	21
8.14	5.713	21	22.6	12.7
8.14	6.072	21	13.04	14.5
8.14	5.95	21	27.71	13.2
8.14	5.701	21	18.35	13.1
8.14	6.096	21	20.34	13.5
5.96	5.933	19.2	9.68	18.9
5.96	5.841	19.2	11.41	20
5.96	5.85	19.2	8.77	21
5.96	5.966	19.2	10.13	24.7];


% split datset into input and output datasets
[a,b]=size(data_set);
inputData=data_set;
inputData(:,b)=[];
outputData=data_set(:,b);

% generate custom FIS and evaluate it
opt = genfisOptions('FCMClustering','FISType','mamdani');
fis = genfis(inputData,outputData,opt);
fis.DefuzzificationMethod = "centroid";
figure('Name','Baseline FIS');
plotfis(fis);
fisOutput = evalfis(fis,inputData);
FisRules = fis.Rules;




%-----------------------------------------------------%
% We now tune the FIS, by:                            %                    
% 1. learning rules from scratch using GA             %
% 2. finding best membership function using GA        %
%-----------------------------------------------------%


% learn the rulebase using GA
[in,out,rule] = getTunableSettings(fis);
fis.Rules=[];
tuneOpt = tunefisOptions('Method','ga','OptimizationType','learning');
tuneOpt.MethodOptions.MaxGenerations = 30;
tuneOpt.MethodOptions.PopulationSize = 100;
tuneOpt.NumMaxRules = 10;
fisNewRules = tunefis(fis,[],inputData,outputData,tuneOpt);
fisNewRulesOutput = evalfis(fisNewRules,inputData);

% tune the input membership function using GA
options = genfisOptions('GridPartition');
options.NumMembershipFunctions = 5;
[in,out,rule] = getTunableSettings(fisNewRules);
opt = tunefisOptions("Method","particleswarm");
opt.MethodOptions.MaxIterations = 20;
fisTunedMF = tunefis(fisNewRules,[in;out;rule],inputData,outputData,opt);
figure('Name','FIS with Tuned MF and learnt rules using GA');
plotfis(fisTunedMF);
fisTunedMfOutput = evalfis(fisTunedMF,inputData);

% calculate costs of all three fis models
costFis = objectiveFunc(outputData,fisOutput);
costFisNewRules = objectiveFunc(outputData,fisNewRulesOutput);
costFisTunedMF = objectiveFunc(outputData,fisTunedMfOutput);

% extract the new learnt rules
FisNewRuleBase = fisNewRules.Rules;

fprintf('Cost of Baseline FIS: %.2f\n ', costFis);
fprintf('Cost of FIS with Learned Rule: %.2f\n ', costFisNewRules);
fprintf('Cost of FIS with Learned Rules and Tuned Membership Functions: %.2f\n', costFisTunedMF);
writeFIS(fisTunedMF,'riceTasteFIS');
%FisRules
%FisNewRuleBase