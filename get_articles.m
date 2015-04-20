
name = 'IP.JRN.ARTC.SC';    %what we're looking for in IndicatorCode
comparison_indicators = char(IndicatorCode);    %put it in a matrix format so we can search through it
[n,m]=size(comparison_indicators);
padded_name = sprintf(['%-', num2str(m),'s'], name);    %all rows in a matrix must have the same number of columns. Matlab achieves this with spaces on the right. We must do the same with our query
comparison_name = repmat(padded_name,n,1);
matching_chars = comparison_indicators == comparison_name;
matching_rows = all(matching_chars,2);

articles = data(matching_rows, :);
articles_lookup = char(CountryCode(matching_rows,:));   %necessary since not all indicators have the same countries