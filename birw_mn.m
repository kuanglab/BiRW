function [R] = birw_mn(Adj_A, Adj_B, score_AB, m, n, alpha, Max_Iter)

if sum(score_AB(:)) > 0
    score_AB = score_AB / sum(score_AB(:));
end
for i = 1 : size(Adj_A, 2)
    if sum(Adj_A(:, i)) > 0
        Adj_A(:, i) = Adj_A(:, i) / sum(Adj_A(:, i));
    end
end
for i = 1 : size(Adj_B, 2)
    if sum(Adj_B(:, i)) > 0
        Adj_B(:, i) = Adj_B(:, i) / sum(Adj_B(:, i));
    end
end

R = zeros(size(score_AB));

m_count = 1;
n_count = 1;

for i = 1 : Max_Iter
    if (m_count <= m)
        m_count = m_count + 1;
        R1 = alpha * Adj_A * R + (1-alpha)*score_AB; 
    end
    
    if (n_count <= n)
        R2 = alpha * R * Adj_B' + (1-alpha)*score_AB;
        n_count = n_count + 1;
    end
    
    if m_count == n_count
        R = (R1 + R2) / 2;
    elseif m_count > n_count
        R = R1;
    else
        R = R2;
    end
%     R = alpha * R;
%     R = R + (1-alpha)*score_AB;
    

%    if max(abs(R(:) - R_old(:))) < 0.01 * max(abs(R_old(:)))
%        break;
%    end    
end
% if i == Max_Iter
%     disp('Isorank didn''t converge.');
% end
