% Middle East prediction

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
factors = make_factors(e, domains, bn, factors);

% prediction
predicted_ppp = prediction_by_elimination(e, domains, factors);

% confusion and accuracy
confusion_table = confusion(ppp, predicted_ppp);
accuracy = sum(ppp == predicted_ppp) / sum(~isnan(ppp));

display(confusion_table);
display(accuracy);