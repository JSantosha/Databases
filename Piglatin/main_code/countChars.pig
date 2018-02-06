A = LOAD './in/para[1-6].txt' as (content:chararray);
B = foreach A generate FLATTEN(TOKENIZE(LOWER(REPLACE(content,'',' ')))) as word;
N = filter B by word matches '[a-z]';
L = group N by word;
X = foreach L generate group,  COUNT(N);
STORE X into './countChars';






