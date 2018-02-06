A = LOAD './in/para[1-6].txt' as (content:chararray);
K = foreach A generate LOWER(REPLACE(content,'',' ')) as words;
B = FOREACH K GENERATE FLATTEN(TOKENIZE(words)) AS word;
N = foreach B generate REGEX_EXTRACT_ALL(word,'([aeiou])') as vowel;
V = group N by vowel;
L = foreach V generate group,  COUNT(N);
STORE L into './vowels';





