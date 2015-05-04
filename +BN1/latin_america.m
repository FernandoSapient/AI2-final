assert( length(ppp) == length(tertiary) && length(ppp) == length(agriculture) && length(ppp) == length(journal) )

domain1 = 'HML'+0;  %domain of a single variable
domain2 = combination({'HML'+0,'HML'+0});   %domain of the joint of two variables
predicted_ppp = zeros(size(ppp));

for(i=1:length(ppp))
    if(~isnan(agriculture(i)))
        if(~isnan(journal(i)))
            %All known: Access corresponding row from CPT
            ppp_probabilities = P_PPP_given_Journal_Agriculture(domain2(:,1)==journal(i) & domain2(:,2)==agriculture(i),:);
        else
            %Journal unknown: multiply prob. of each value of journal with
            %sum of corresponding prob. for the known value of agriculture
            ppp_probabilities = (P_PPP_given_Journal_Agriculture(domain2(:,2)==agriculture(i),:)'*P_Journal')';
        end
    else
        if(~isnan(tertiary(i)))
            P_joint_agriculture = P_Agriculture_given_Tertiary(domain1==tertiary(i),:)*P_Tertiary(domain1==tertiary(i));
        else
            P_joint_agriculture = (P_Agriculture_given_Tertiary'*P_Tertiary')';
        end
        if(~isnan(journal(i)))
            %Agriculture unknown, Journal known: multiply prob. of each
            %value of agriculture with corresponding prob. for known value
            %of Journal
            ppp_probabilities = (P_PPP_given_Journal_Agriculture(domain2(:,1)==journal(i),:)'*P_joint_agriculture')'*P_Journal(domain1==journal(i));
        else
            %All unknown: multiply conditional of each combination by the
            %joint probability of agriculture and journals for the that
            %combination
            ppp_probabilities = P_PPP_given_Journal_Agriculture' * (repmat(P_joint_agriculture',3,1).* [ P_Journal(1)*ones(1,3) P_Journal(2)*ones(1,3) P_Journal(3)*ones(1,3) ]') ;
        end
    end
    [~, most_likely] = max(ppp_probabilities);
    predicted_ppp(i) = domain1(most_likely);
end

display(confusion(ppp, predicted_ppp));

accuracy = sum(ppp == predicted_ppp) / sum(~isnan(ppp))
