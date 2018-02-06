A = LOAD './in/para[1-6].txt' as (content:chararray);
B = foreach A generate FLATTEN(TOKENIZE(LOWER(REPLACE(content,'',' ')))) as word;
C = filter B by word matches '[aeiou]';
M = group C by word;
X = foreach M generate group,  COUNT(C);
STORE X into './vowels';


