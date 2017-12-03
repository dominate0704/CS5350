clear;
load('data.mat');
data{1} = training00;
data{2} = training01;
data{3} = training02;
data{4} = training03;
data{5} = training04;
gamma = [10,1,0.1,0.01,0.001,0.0001];
C = [10,1,0.1,0.01,0.001,0.0001];
tree = baggingtree( traindata, 100, 3 ,100);
[list, errors] = visitNode(tree, testdata);