clear all;
table = parse_data("BeijingPM20100101_20151231.csv");
[train,test]= separate_data(table);
train = parse_data_dynamicPerceptron(train);
test = parse_data_dynamicPerceptron(test);
[w,b,errors] = periodicalSVM_SGD(train(:,1:end),1,1000);
[correctNumber,result] = checkPeriodical(test(:,1:end),w,b);
[correctNumber1,result1] = checkPeriodical(train(:,1:end),w,b);
winingRate =correctNumber/ length(test(:,1));
winingRate1 =correctNumber1/ length(train(:,1));