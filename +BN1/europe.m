%% Eliminate Tertiary from Journal...
for i=1:3
    for j=1:3
       P_Journal_and_Tertiary(i,j) = P_Tertiary(i) .* P_Journal_given_Tertiary(i,j);
    end
end
 P_Journal(1,1)=sum(P_Journal_and_Tertiary(:,1));
 P_Journal(1,2)=sum(P_Journal_and_Tertiary(:,2));
 P_Journal(1,3)=sum(P_Journal_and_Tertiary(:,3));
 P_Journal;
%% Eliminate Tertiary from Ind...
for i=1:3
    for j=1:3
       P_Industry_and_Tertiary(i,j)=P_Tertiary(i).*P_Industry_given_Tertiary(i,j);
    end
end
 P_Industry(1,1)=sum(P_Industry_and_Tertiary(:,1));
 P_Industry(1,2)=sum(P_Industry_and_Tertiary(:,2));
 P_Industry(1,3)=sum(P_Industry_and_Tertiary(:,3));
 P_Industry;
 %% Compute the Pro of the PPP ...
    domains{1}='HML'+0; % Agr. domain
    domains{2}='HML'+0; % Ind. domain
    domains{3}='HML'+0; % Jour. domain
    
 %% query for the Euorpe region...
all_domain = combination(domains);   %domain of the joint of two variables
predicted_ppp = zeros(size(ppp));

for i=1:length(ppp)-1
    if(~isnan(agriculture(i)))
        if(~isnan(industry(i)))
            % All known: Access corresponding row from CPT
            ppp_probabilities = P_PPP_given_Journal_Agriculture_Industry(all_domain(:,1)==journal(i) & all_domain(:,2)==agriculture(i) & all_domain(:,3)==industry(i),:);
        elseif(~isnan(journal(i)))
            % All known: Access corresponding row from CPT
            ppp_probabilities = P_PPP_given_Journal_Agriculture_Industry(all_domain(:,1)==journal(i) & all_domain(:,2)==agriculture(i) & all_domain(:,3)==industry(i),:);
        else
            % unknown: multiply prob. of each value of journal with
            % sum of corresponding prob. for the known value of agriculture
            ppp_probabilities = (P_PPP_given_Journal_Agriculture_Industry(all_domain(:,1)==journal(i)& all_domain(:,3)==industry(i),:)'*P_Agriculture')';
        end
    else
        if(~isnan(tertiary(i)))
            P_Industry_joint_Tertiary = P_Industry_given_Tertiary(domains{2}==tertiary(i),:)*P_Tertiary(domains{1}==tertiary(i));
            P_Journal_joint_Tertiary = P_Journal_given_Tertiary(domains{3}==tertiary(i),:)*P_Tertiary(domains{1}==tertiary(i));

        else
            P_joint_Industry = (P_Industry_given_Tertiary'*P_Tertiary')';
            P_joint_Journal = (P_Journal_given_Tertiary'*P_Tertiary')';
            
        end
        if(~isnan(agriculture(i)))&&(~isnan(journal(i)))
            %Agriculture unknown, Journal known: multiply prob. of each
            %value of agriculture with corresponding prob. for known value
            %of Journal
            ppp_probabilities = (P_PPP_given_Journal_Agriculture_Industry(all_domain(:,2)==agriculture(i) &all_domain(:,1)==journal(i),:)'*P_joint_Industry')'*P_Agriculture(domains{1}==agriculture(i))*P_Journal_given_Tertiary(domains{1}==journal(i));
        elseif(~isnan(agriculture(i)))&&(~isnan(industry(i)))
            %Agriculture unknown, Journal known: multiply prob. of each
            %value of agriculture with corresponding prob. for known value
            %of Journal
            ppp_probabilities = (P_PPP_given_Journal_Agriculture_Industry(all_domain(:,3)==industry(i) &all_domain(:,1)==journal(i),:)'*P_joint_Journal')'*P_Agriculture(domains{1}==agriculture(i))*P_Industry_given_Tertiary(domains{1}==industry(i));
        else
            %All unknown: multiply conditional of each combination by (?)
            joint_all = repmat(P_joint_Industry',9,1);
            joint_all = joint_all .* repmat([ P_Agriculture(1)*ones(1,3) P_Agriculture(2)*ones(1,3) P_Agriculture(3)*ones(1,3) ]',3,1) ;
            joint_all = joint_all .* [ P_Journal(1)*ones(1,9) P_Agriculture(2)*ones(1,9) P_Agriculture(3)*ones(1,9) ]' ;
            ppp_probabilities = P_PPP_given_Journal_Agriculture_Industry'* joint_all;
        end
    end
    [~, most_likely] = max(ppp_probabilities);
    try
        predicted_ppp(i) = domains{1}(most_likely);
    catch
        ppp_probabilities;
        most_likely;
        predicted_ppp;
        agriculture(i);
        industry(i);
        journal(i);
        tertiary(i);
        ppp(i);
    end
end
display('The preduction of the purchasing power parity (PPP) is :');
accuracy =sum(ppp == predicted_ppp) / sum(~isnan(ppp))