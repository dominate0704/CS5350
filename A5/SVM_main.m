clear;
load('data.mat');
data{1} = training00;
data{2} = training01;
data{3} = training02;
data{4} = training03;
data{5} = training04;
gamma = [10,1,0.1,0.01,0.001,0.0001];
C = [10,1,0.1,0.01,0.001,0.0001];
sigma2 = [0.1,1,10,100,1000,10000];
lambda = [2,1.5,1,0.5];
Best = zeros(1,6);
% BestAnswer; Answer; AnswerAccuracy; TrainingAccuracy;
% TestAccuray;Best_parameter
for i = 1:5
  dataTrain = [data{mod(i,5)+1} data{mod(i+1,5)+1} data{mod(i+2,5)+1} data{mod(i+3,5)+1}];
  dataTest = data{i};
  % SGD
  for j = 1:length(gamma)
      for m = 1:length(C)
          if i ==1
              AnswerAccuracy(j*m).accuracy = 0;
          end
          w_cur = SGD(dataTrain,gamma(j),C(m), 5);
          Answer((j-1)*m+m).weight = w_cur;
          [correctNumber,result] = checkErrors(dataTest, w_cur);
          len = length(dataTest);
          AnswerAccuracy((j-1)*m+m).accuracy =AnswerAccuracy(j*m).accuracy+ correctNumber/len;
          AnswerAccuracy((j-1)*m+m).gamma = gamma(j);
          AnswerAccuracy((j-1)*m+m).C = C(m);
      end
  end
  
  index = length(gamma)*length(C);
  % LogisticRegression
  for j = 1:length(gamma)
      for m = 1:length(sigma2)
          if i ==1
              AnswerAccuracy(index+j*m).accuracy = 0;
          end
          w_cur = LogisticRegression(dataTrain,gamma(j),sigma2(m), 5);
          Answer(index+j*m).weight = w_cur;
          [correctNumber,result] = checkErrors(dataTest, w_cur);
           len = length(dataTest);
          AnswerAccuracy(index+j*m).accuracy = AnswerAccuracy(index+j*m).accuracy+correctNumber/len ;
          AnswerAccuracy(index+j*m).gamma = gamma(j);
          AnswerAccuracy(index+j*m).sigma2 = sigma2(m);
      end
  end
  index = index + length(gamma)*length(sigma2);
  % Naivebayes
  for j = 1:length(lambda)
      if i ==1
          AnswerAccuracy(index+j).accuracy = 0;
      end
      p = Naivebayes(dataTrain,lambda(j));
      Answer(index+j).p = p;
      [correctNumber,result] = predictNaiveBayes(dataTest,p);
      len = length(dataTest);
      AnswerAccuracy(index+j).accuracy =AnswerAccuracy(index+j).accuracy+ correctNumber/len;
      AnswerAccuracy(index+j).lambda = lambda(j);
  end
end

index = length(gamma)*length(C);
%%
%SGD
best =0;
for n = 1:index
    if best < AnswerAccuracy(n).accuracy
        best = AnswerAccuracy(n).accuracy;
        gamma_SGD = AnswerAccuracy(n).gamma;
        C_SGD = AnswerAccuracy(n).C;
    end
end

x1 = ['For SGD, the best hyper_parameter: gamma = ', num2str(gamma_SGD), ' ; C = ', num2str(C_SGD)];
x2 = ['Average cross-validation accuracy = ',num2str(best/5)];
disp(x1);
disp(x2);
w_cur = SGD(traindata,gamma_SGD,C_SGD, 5);
[correctNumber,~] = checkErrors(traindata, w_cur);
TrainingAccuracy(1) = correctNumber/length(traindata);
[correctNumber,~] = checkErrors(testdata, w_cur);
TestAccuracy(1) = correctNumber/length(testdata);


%% LogisticRegression
index = length(gamma)*length(C)+1;
index1 = index + length(gamma)*length(sigma2);
best =0;
for n = index:index1
    if best < AnswerAccuracy(n).accuracy
        best = AnswerAccuracy(n).accuracy;
        gamma_LR = AnswerAccuracy(n).gamma;
        sigma2_LR = AnswerAccuracy(n).sigma2;
    end
end
x1 = ['For LR, the best hyper_parameter: gamma = ', num2str(gamma_LR), ' ; sigma2 = ', num2str(sigma2_LR)];
x2 = ['Average cross-validation accuracy = ',num2str(best/5)];
disp(x1);
disp(x2);
w_cur = LogisticRegression(traindata,gamma_LR,sigma2_LR, 5);
[correctNumber,~] = checkErrors(traindata, w_cur);
TrainingAccuracy(2) = correctNumber/length(traindata);
[correctNumber,~] = checkErrors(testdata, w_cur);
TestAccuracy(2) = correctNumber/length(testdata);

%% Naivebayes
index = index1+1;
index1 = index + length(lambda);
best =0;
for n = index:index1
   if best < AnswerAccuracy(n).accuracy
    best = AnswerAccuracy(n).accuracy;
    lambda_NB = AnswerAccuracy(n).lambda;
   end
end
x1 = ['For LR, the best hyper_parameter: lambda = ', num2str(lambda_NB)];
x2 = ['Average cross-validation accuracy = ',num2str(best/5)];
disp(x1);
disp(x2);
p = Naivebayes(traindata,lambda_NB);
[correctNumber,~] = predictNaiveBayes(traindata,p);
TrainingAccuracy(3) = correctNumber/length(traindata);
[correctNumber,~] = predictNaiveBayes(testdata,p);
TestAccuracy(3) = correctNumber/length(testdata);


