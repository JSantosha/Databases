A = LOAD './in/para[1-6].txt' as (content:chararray);
K = foreach A generate LOWER(REPLACE(content,'',' ')) as words;
B = FOREACH K GENERATE FLATTEN(TOKENIZE(words)) AS word;
M = foreach B generate REGEX_EXTRACT_ALL(word,'([a-z])') as letter;
C = group M by letter;
D = foreach C generate group,  COUNT(M);
STORE D into './lettercounting';






