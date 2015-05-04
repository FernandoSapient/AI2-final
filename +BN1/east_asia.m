assert( length(ppp) == length(agriculture) && length(ppp) == length(journal) )

domain1 = 'HML'+0;  %domain of a single variable
domain2 = combination({'HML'+0,'HML'+0});   %domain of the joint of two variables
predicted_ppp = zeros(size(ppp));

for i=1:length(ppp)
    if(~isnan(journal(i)))
        if(~isnan(agriculture(i)))
            %All known: Access corresponding row from CPT
            ppp_probabilities = P_PPP_given_Journal_Agriculture(domain2(:,1)==journal(i) & domain2(:,2)==agriculture(i),:);
        else
            %Agriculture unknown: multiply prob. of each value of agriculture with
            %sum of corresponding prob. for the known value of journal
            ppp_probabilities = (P_PPP_given_Journal_Agriculture(domain2(:,2)==journal(i),:)'*P_Agriculture')';
        end
    else
        if(~isnan(agriculture(i)))
            %Journal unknown, Agriculture known: multiply prob. of each
            %value of journal with corresponding prob. for known value
            %of Agriculture
            ppp_probabilities = (P_PPP_given_Journal_Agriculture(domain2(:,1)==agriculture(i),:)'*P_Journal')'*P_Agriculture(domain1==agriculture(i));
        else
            %All unknown: multiply conditional of each combination by (?)
            ppp_probabilities = P_PPP_given_Journal_Agriculture' * (repmat(P_Journal',3,1).* [ P_Agriculture(1)*ones(1,3) P_Agriculture(2)*ones(1,3) P_Agriculture(3)*ones(1,3) ]') ;
        end
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