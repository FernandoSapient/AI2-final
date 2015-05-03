assert( length(ppp) == length(tertiary) && length(ppp) == length(agriculture) && length(ppp) == length(journal) )

domain1 = 'HML'+0;  %domain of a single variable
domain2 = combination({'HML'+0,'HML'+0});   %domain of the joint of two variables
predicted_ppp = zeros(size(ppp));

for(i=1:length(ppp))
    if(~isnan(agriculture(i)))
        if(~isnan(journal(i)))
            ppp_probabilities = P_PPP_given_Journal_Agriculture(domain2(:,1)==journal(i) & domain2(:,2)==agriculture(i),:);
        else
            ppp_probabilities = (P_PPP_given_Journal_Agriculture(domain2(:,2)==agriculture(i),:)'*P_Journal')';
        end
    else
        if(~isnan(journal(i)))
            if(~isnan(tertiary(i))
                ppp_probabilities = (P_PPP_given_Journal_Agriculture(domain2(:,1)==journal(i),:)'*P_Agriculture_given_Tertiary(domain1==tertiary(i),:)')';
        else
        end
    end
    [~, most_likely] = max(ppp_probabilities);
    predicted_ppp(i) = domain1(most_likely);
end
accuracy = sum(ppp == predicted_ppp);