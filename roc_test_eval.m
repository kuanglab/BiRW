function [distri, topn, ROCn, IX] = roc_test_eval(file_name)

disp(['loading file ' file_name  '...']);
load (file_name);

R(isnan(R)) = -1;
%if (dim==1)
%    R=R';
%end

load 'g_p_network_emerge';
IX_row = find(sum(g_p_network_emerge, 2)>0);
g_p_network_emerge = g_p_network_emerge(IX_row,:);
R=R(IX_row,:);

[rows, cols] = size(g_p_network_emerge);

ROCn = zeros(rows, 6);

[B, IX] = sort(R, 2, 'descend');
clear R;
clear B;

topn = zeros(rows, cols);
for j = 1 : rows
    for k = 1 : cols
	real_col = IX(j, k);
        if (g_p_network_emerge(j, real_col) > 0)
            topn(j, k) = 1;
        else
            topn(j, k) = 0;
        end
    end

    ROCn(j,1) = ROC(topn(j,:), 50, 2);
    ROCn(j,2) = ROC(topn(j,:), 100, 2);
    ROCn(j,3) = ROC(topn(j,:), 300, 2);
    ROCn(j,4) = ROC(topn(j,:), 500, 2);
    ROCn(j,5) = ROC(topn(j,:), 1000, 2);
    ROCn(j,6) = ROC(topn(j,:), 8919, 2);
end

% save('ROC_000.mat', 'ROCn');

sample_size = 50;
distri = zeros(sample_size, 1+6);
for i = 1 : sample_size
    distri(i, 1) = i / sample_size;
end

for i = 1 : sample_size
    distri(i, 2) = sum(ROCn(:,1)>=distri(i, 1));
    distri(i, 3) = sum(ROCn(:,2)>=distri(i, 1));
    distri(i, 4) = sum(ROCn(:,3)>=distri(i, 1));
    distri(i, 5) = sum(ROCn(:,4)>=distri(i, 1));
    distri(i, 6) = sum(ROCn(:,5)>=distri(i, 1));
    distri(i, 7) = sum(ROCn(:,6)>=distri(i, 1));
end

