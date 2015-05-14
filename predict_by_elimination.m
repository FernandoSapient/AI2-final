function [ prediction ] = predict_by_elimination( e, domains, factors )
% prediction_by_elimination - Predict PPP by elimination inference
%
% input:
%       - e, the evidences
%       - domains, the joint domains for all the evidences
%       - factors, the joint factors

% Assume domain = ['H', 'M', 'L']' for all discretized variables;
domain = ['H' 'M' 'L']' + 0;

[R, D] = size(e);
prediction = zeros(R, 1);
for k = 1:R
    current_domains = domains;
    probability = factors;
    
    % loop for all variables in an evidence
    for d = 1:D
        variable = e(k, d);
        column = current_domains(:, end);
        
        if isnan(variable)
            [r, c] = size(probability);
            sum_out = zeros(r/3, c);
            
            % Summing out
            for l = 1:size(sum_out, 1)
                from = (l-1) * 3 + 1;
                to = from + 2;
                sum_out(l, :) = sum( probability(from:to, :) );
            end
            probability = sum_out;
        else
            % Lookup when the variable exists
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
    prediction(k) = domain(most_likely);
end

