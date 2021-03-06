function baseline_accuracy( Dataset )
% baseline_accuracy - Print Baseline networks accuracy for Bayesian Networks 1
%
% dependencies: [discretize, Pr, CPT, combination, confusion]

% Assume fix domain for all variables
domain = ['H' 'M' 'L']' + 0;

tertiary    = discretize(Dataset(:,11));
journal     = discretize(Dataset(:,1));
agriculture = discretize(Dataset(:,3));
industry    = discretize(Dataset(:,4));
government  = discretize(Dataset(:,7));
ppp         = discretize(Dataset(:,9));

% Parameter learning
P_Tertiary    = Pr(tertiary(~isnan(tertiary)), domain);
P_Journal     = Pr(journal(~isnan(journal)), domain);
P_Agriculture = Pr(agriculture(~isnan(agriculture)), domain);
P_Industry    = Pr(industry(~isnan(industry)), domain);
P_Government  = Pr(government(~isnan(government)), domain);

missing = isnan(ppp) | isnan(tertiary) | isnan(journal) | ...
    isnan(agriculture) | isnan(industry) | isnan(government);
P_PPP_given_Tertiary_Journal_Agriculture_Industry_Government = CPT(...
    ppp(~missing), tertiary(~missing), journal(~missing), ...
    agriculture(~missing), industry(~missing), government(~missing));


% Inference by elimination
% evidences
e = [government industry agriculture journal tertiary];

% bn
bn.cpts{1} = P_Government;
bn.cpts{2} = P_Industry;
bn.cpts{3} = P_Agriculture;
bn.cpts{4} = P_Journal;
bn.cpts{5} = P_Tertiary;

domains = combination({domain' domain' domain' domain' domain'});
% joint factors
factors = P_PPP_given_Tertiary_Journal_Agriculture_Industry_Government;
factors = make_factors(e, domains, bn, factors);

% prediction
predicted_ppp = predict_by_elimination(e, domains, factors);

% confusion and accuracy
confusion_table = confusion(ppp, predicted_ppp);
accuracy = sum(ppp == predicted_ppp) / sum(~isnan(ppp));

display('Baseline accuracy');
display('-----------------------');
display(confusion_table);
display(accuracy);
