clear;
load('data.mat');
Answer_tree = baggingtree( traindata, 100, 3 ,1000);
[list, errors] = visitNode(Answer_tree, testdata);
len = length(testdata);
AnswerAccuracy = (len-errors)/len;
save('BG_dep3.mat','Answer_tree','AnswerAccuracy');