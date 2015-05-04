% evidences
e = [government industry agriculture journal];

% bn
bn.cpts{1} = P_Government;
bn.cpts{2} = P_Industry;
bn.cpts{3} = P_Agriculture;
bn.cpts{4} = P_Journal;

domains = combination({domain' domain' domain' domain'});
% joint factors
factors = P_PPP_given_Journal_Agriculture_Industry_Government;
[~, D] = size(e);

for d = 1:D
    column = domains(:, end-d+1);
    for value = 'HML' + 0
        factor = factors(column == value, :) * bn.cpts{d}(domain == value);
        factors(column == value, :) = factor;
    end
end

% prediction
predicted_ppp = zeros( size(ppp) );
for k = 1:length(ppp)
    probability = factors;
    current_domains = domains;
    
    for d = 1:D
        variable = e(k, d);
        column = current_domains(:, end);
        
        if isnan(variable)
            [r, c] = size(probability);
            sum_out = zeros(r/3, c);
            
            for l = 1:size(sum_out, 1)
                from = (l-1) * 3 + 1;
                to = from + 2;
                sum_out(l, :) = sum( probability(from:to, :) );
            end
            probability = sum_out;
        else
            probability = probability(column == variable, :);
        end
        
        % re-generate current_domains
        variable_domains = cell(1, D-d);
        for l = 1:D-d
            variable_domains{l} = domain';
        end

        if size(variable_domains, 2) > 0
            current_domains = combination(variable_domains);
        end
    end
    
    % prediction
    [~, most_likely] = max(probability);
    predicted_ppp(k) = domain(most_likely);
end

% confusion and accuracy
ppp_is_H = predicted_ppp(ppp == 'H');
ppp_is_M = predicted_ppp(ppp == 'M');
ppp_is_L = predicted_ppp(ppp == 'L');

confusion_table(1, :) = [sum(ppp_is_H == 'H') sum(ppp_is_H == 'M') sum(ppp_is_H == 'L')];
confusion_table(2, :) = [sum(ppp_is_M == 'H') sum(ppp_is_M == 'M') sum(ppp_is_M == 'L')];
confusion_table(3, :) = [sum(ppp_is_L == 'H') sum(ppp_is_L == 'M') sum(ppp_is_L == 'L')];

display(confusion_table);
accuracy = sum(ppp == predicted_ppp) / sum(~isnan(ppp))