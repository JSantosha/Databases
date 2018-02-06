A = load './para1.txt';
B = foreach A generate flatten(TOKENIZE((bytearray)$0)) as word;
E = FOREACH B GENERATE FLATTEN(REGEX_EXTRACT(word, '([^a])', 1)) AS char;
C = group E by char;
D = foreach C generate COUNT(E), group;
store D into './wordcount';