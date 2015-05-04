assert( length(ppp) == length(tertiary) && length(ppp) == length(journal) )

domain1 = 'HML'+0;  %domain of a single variable
% domain2 = combination({'HML'+0,'HML'+0});   %domain of the joint of two variables
predicted_ppp = zeros(size(ppp));

for i=1:length(ppp)
    if(~isnan(journal(i)))
        %All known: Access corresponding row from CPT
        ppp_probabilities = P_PPP_given_Journal(domain1==journal(i), :);
    else
        if(~isnan(tertiary(i)))
            P_joint_journal = P_Journal_given_Tertiary(domain1==tertiary(i), :) * P_Tertiary(domain1==tertiary(i));
        else
            P_joint_journal = (P_Journal_given_Tertiary' * P_Tertiary')';
        end
        
        ppp_probabilities = (P_PPP_given_Journal' * P_joint_journal')';
    end
    
    [~, most_likely] = max(ppp_probabilities);
    predicted_ppp(i) = domain1(most_likely);
end

ppp_is_H = predicted_ppp(ppp == 'H');
ppp_is_M = predicted_ppp(ppp == 'M');
ppp_is_L = predicted_ppp(ppp == 'L');

confusion_table(1, :) = [sum(ppp_is_H == 'H') sum(ppp_is_H == 'M') sum(ppp_is_H == 'L')];
confusion_table(2, :) = [sum(ppp_is_M == 'H') sum(ppp_is_M == 'M') sum(ppp_is_M == 'L')];
confusion_table(3, :) = [sum(ppp_is_L == 'H') sum(ppp_is_L == 'M') sum(ppp_is_L == 'L')];

display(confusion_table);
accuracy = sum(ppp == predicted_ppp) / sum(~isnan(ppp))