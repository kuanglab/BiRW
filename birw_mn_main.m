alpha = 0.8;
m = 4;
n = 4;
disp(['BiRW with alpha=' num2str(alpha) ',m=' num2str(m) ' and n=' num2str(n) ' is initializing...']);
disp('phenotype similarity network is loading...');
load ('phenotype_logistic.mat');
disp('gene network (PPI network) is loading...');
load ('ppi_network.mat');
disp('disease phenotype-gene network (OMIM May, 2007) is loading...');
load ('g_p_network.mat');
g_p_network = g_p_network';

disp('BiRW is running...');
R = birw_mn(phenotype_logistic, ppi_network,  g_p_network,m, n, alpha, max([m, n]));

disp('Saving ranking result...');
file_name = ['BiRW_predict_alpha' num2str(alpha) '_m' num2str(m) '_n' num2str(n) '.mat'];
save(file_name, 'R');

disp('====================================================');
disp('Evaluating the ranking result with new associations in OMIM May, 2010...');
[distri, topn, ROCn, IX] = roc_test_eval(file_name);
avg_ROCn = mean(ROCn);
disp(['AUC50:' num2str(avg_ROCn(1))]);
disp(['AUC100:' num2str(avg_ROCn(2))]);
disp(['AUC300:' num2str(avg_ROCn(3))]);
disp(['AUC500:' num2str(avg_ROCn(4))]);
disp(['AUC1000:' num2str(avg_ROCn(5))]);
disp(['AUC:' num2str(avg_ROCn(6))]);