# BiRW
Bi-ramdom walk for phenotype-gene association prediction.


Just run "birw_mn_main" in matlab. Algorithm BiRW with default parameters (alpha=0.8, m=4 and n=4) will be executed and the evaluation can also be performed, the average AUC score up to 50, 100, 300, 500, 1000 and all can be displayed.
You can also change the parameters in the "birw_mn_main.m".

File list:
"birw_mn_main.m"	The main entry of the source code, the BiRW algorithm and evaluation procedure are called in this script file.
"birw_mn.m"		The algorithm BiRW is implemented in this function
"roc_test_eval.m"		The evaluation with new associations in OMIM May-2010(g_p_network_emerge.mat), and it is called by birw_mn_main.m
"ROC.m"			AUC functions for a ranking list, and it is called by roc_eval.m

Data Files:
"phenotype_logistic.mat"	Phenotype similarity network is used as a phenotype network. Based on phenotype similarity matrix from van Driel 2006, a logistic function is used to transform the similarity score to logistic score.
"ppi_network.mat"		Protein-protein interaction network is used as a gene network
"g_p_network.mat"		The phenotype-gene associations in OMIM May-2007, and it is used as phenotype-gene network.
"g_p_network_emerge.mat"	The new phenotype-gene associations in OMIM May-2010.

Contact Maoqiang Xie (xiemq@nankai.edu.cn) or Rui Kuang (kuan0009@umn.edu), if you have any question.

Citations:
Xie, MaoQiang; Xu, YingJie; Zhang, YaoGong; Hwang, TaeHyun; Kuang, Rui
Network-based Phenome-Genome Association Prediction by Bi-Random Walk Journal Article
In: PloS one, 10 (5), pp. e0125138, 2015.

Xie, Maoqiang; Hwang, Taehyun; Kuang, Rui
Prioritizing disease genes by bi-random walk
In: Pacific-Asia Conference on Knowledge Discovery and Data Mining, pp. 292–303, Springer 2012.
