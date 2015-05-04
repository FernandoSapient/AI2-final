function confusion_table = confusion( ppp, predicted_ppp )
%Computes the confusion matrix for an H-M-L variable
ppp_is_H = predicted_ppp(ppp == 'H');
ppp_is_M = predicted_ppp(ppp == 'M');
ppp_is_L = predicted_ppp(ppp == 'L');

confusion_table(1, :) = [sum(ppp_is_H == 'H') sum(ppp_is_H == 'M') sum(ppp_is_H == 'L')];
confusion_table(2, :) = [sum(ppp_is_M == 'H') sum(ppp_is_M == 'M') sum(ppp_is_M == 'L')];
confusion_table(3, :) = [sum(ppp_is_L == 'H') sum(ppp_is_L == 'M') sum(ppp_is_L == 'L')];
end

