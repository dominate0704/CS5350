clear all;
load('data.mat');
data{1} = training00;
data{2} = training01;
data{3} = training02;
data{4} = training03;
data{5} = training04;
gamma = [10,1,0.1,0.01,0.001,0.0001];
sigma2 = [0.1,1,10,100,1000,10000];
w = LogisticRegression(testdata,gamma(2), sigma2(3),2);
[correctNumber,result] = checkErrors(testdata, w);  