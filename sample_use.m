load_all_into_vectors_autogen;

data = cat(2, x98, x99, x00, x01, x02, x03, x04, x05, x06, x07, x08, x09, x10);

get_articles;

USA_articles = get_all_years(articles, articles_lookup, 'USA');

plot(1998:2010,USA_articles);
title('Number of journal articles published in the United States');
xlabel('year');
ylabel('articles');
set(gca,'YTickLabel',separatethousands(get(gca,'YTick').',','))
