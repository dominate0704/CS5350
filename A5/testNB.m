clear all;
load('data.mat');
data{1} = training00;
data{2} = training01;
data{3} = training02;
data{4} = training03;
data{5} = training04;
lambda = [2,1.5,1,0.5];
p = Naivebayes(training04,1);
[correctNumber,result] = predictNaiveBayes(testdata,p);
